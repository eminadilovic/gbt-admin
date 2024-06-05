import '../entities/worker/worker_request.dart';

abstract class WorkersRepository {
  Future<bool> createWorker(WorkerRequest workerData, String userId);
  Future<bool> deleteWorker(String workerId, String userId);
  Future<List<WorkerRequest>> getWorkers();
}
