// ignore_for_file: unnecessary_lambdas

import '../../../../services/auth/backend/authenticator.dart';
import '../../domain/entities/worker/worker_request.dart';
import '../../domain/repositories/workers_repository.dart';
import '../datasource/workers_datasource.dart';

class WorkersRepositoryImpl implements WorkersRepository {
  WorkersRepositoryImpl();

  final _source = WorkersDatasource();

  @override
  Future<bool> createWorker(WorkerRequest worker, String userId) async {
    try {
      return await _source.addWorker(worker.userId, worker.toJson(), userId);
    } catch (e) {
      print('Error [creating worker] $e');
      return false;
    }
  }

  @override
  Future<bool> deleteWorker(String workerId, String userId) async {
    try {
      return await _source.deleteWorker(workerId, userId);
    } catch (e) {
      print('Error [deleting worker] $e');
      return false;
    }
  }

  @override
  Future<List<WorkerRequest>> getWorkers() async {
    try {
      final userId = const Authenticator().userId;
      if (userId == null) {
        return Future.value([]);
      }
      return await _source.getWorkers(userId);
    } catch (e) {
      print('Error [getting workers] $e');
      return Future.value([]);
    }
  }
}
