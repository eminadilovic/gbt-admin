import '../entities/worker/worker_request.dart';

abstract class WorkersRepository {
  Future<String> createShop(WorkerRequest shopData);
}
