import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../services/auth/backend/authenticator.dart';
import '../../../image_uploader/image_uploader_helper.dart';
import '../../data/repositoriesImpl/workersRepositoryImpl.dart';
import '../../domain/entities/worker/worker_request.dart';
import '../../domain/repositories/workers_repository.dart';
import 'image_upload_provider.dart';

final workersControllerProvider = StateNotifierProvider<WorkerController, AsyncValue<List<WorkerRequest>>>((ref) {
  final workersRepository = WorkersRepositoryImpl();

  return WorkerController(workersRepository, ref);
});

class WorkerController extends StateNotifier<AsyncValue<List<WorkerRequest>>> {
  WorkerController(this.workersRepository, this.ref) : super(const AsyncValue.loading()) {
    _fetchWorkers();
  }
  final Ref ref;
  final WorkersRepository workersRepository;

  Future<void> _fetchWorkers() async {
    try {
      final workers = await workersRepository.getWorkers();

      state = AsyncValue.data(workers);
    } catch (error) {
      state = AsyncValue.error(error, StackTrace.current);
      print('Greška prilikom dohvata servisa: $error');
    }
  }

  Future<bool> deleteWorker(String workerId) async {
    final userId = const Authenticator().userId!;
    final done = await workersRepository.deleteWorker(workerId, userId);
    if (done) {
      state.value?.removeWhere((element) => element.userId == workerId);
      return true;
    } else {
      return false;
    }
  }

  Future<bool?> addWorker(WorkerRequest worker) async {
    final uploadedImage = await uploadImage(worker.userId);
    if (uploadedImage == null || const Authenticator().userId == null) return false;
    final workerRequest = worker.copyWith(profileImage: uploadedImage);
    final done = await workersRepository.createWorker(workerRequest, const Authenticator().userId!);
    if (done) {
      state = state.whenData((currentWorkers) {
        final updatedWorkers = List<WorkerRequest>.from(currentWorkers);
        updatedWorkers.add(workerRequest);
        return updatedWorkers;
      });
      return true;
    } else {
      return false;
    }
  }

  Future<String?> uploadImage(String workerId) async {
    try {
      final workerImage = ref.read(workerImageFileCropped);

      String? profileImageUrl;
      final shopId = const Authenticator().userId;

      if (workerImage != null) {
        profileImageUrl = await ImageUploaderHelper.uploadImage(workerImage.path, '$shopId/workers', workerId);

        return profileImageUrl;
      }

      return null;
    } catch (e) {
      print('error $e');
      return null;
    }
  }
}
