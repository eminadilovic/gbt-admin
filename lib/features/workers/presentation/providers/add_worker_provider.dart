import 'package:riverpod/riverpod.dart';

import '../../domain/entities/worker/worker_request.dart';

class WorkerRequestNotifier extends StateNotifier<WorkerRequest> {
  WorkerRequestNotifier() : super(WorkerRequest(userId: '', name: '', profileImage: '', title: ''));

  void updateWorker(WorkerRequest worker) {
    state = worker;
  }
}

final addWorkerProvider = StateNotifierProvider<WorkerRequestNotifier, WorkerRequest>((ref) => WorkerRequestNotifier());
