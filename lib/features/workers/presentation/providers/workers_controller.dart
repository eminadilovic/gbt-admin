import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/repositoriesImpl/workersRepositoryImpl.dart';
import '../../domain/entities/worker/worker_request.dart';
import '../../domain/repositories/workers_repository.dart';

final workersControllerProvider = StateNotifierProvider<WorkerController, List<WorkerRequest?>>((ref) {
  final workersRepository = WorkersRepositoryImpl();

  return WorkerController(workersRepository, ref);
});

class WorkerController extends StateNotifier<List<WorkerRequest?>> {
  WorkerController(this.workersRepository, this.ref) : super([]) {
    state = [];
  }
  final Ref ref;
  final WorkersRepository workersRepository;

  Future<String?> addWorker(WorkerRequest worker) async {
    return null;

    /*  if (state != null) {
      final uploadedImages = await uploadImages();
      if (uploadedImages) {
        final shopId = await registrationRepository.createShop(state);
        return shopId;
      } else {
        return null;
      }
    } else {
      print('state je null');
      return null;
    } */
  }

  Future<bool> uploadImage() async {
    return true;
    /*  try {
      final workerImage = ref.read(workerImageFileCropped);

      String? profileImageUrl;

      if (workerImage != null) {
        profileImageUrl = await ImageUploaderHelper.uploadImage(
            workerImage.path, '${state.userId}_${shopNameTrimmed!.toLowerCase()}', 'profileImage');
      }

      if (overviewImages != null && overviewImages.isNotEmpty) {
        for (var i = 0; i < overviewImages.length; i++) {
          final overviewImage = await ImageUploaderHelper.uploadImage(overviewImages[i].path,
                  '${state.userId}_${shopNameTrimmed?.toLowerCase()}', 'overviewImage_${i + 1}') ??
              '';
          overviewImagesUrl.add(overviewImage);
        }
      }

      state = state.copyWith(profileImage: profileImageUrl ?? '', overviewImages: overviewImagesUrl);

      return true;
    } catch (e) {
      print('error $e');
      return false;
    } */
  }
}
