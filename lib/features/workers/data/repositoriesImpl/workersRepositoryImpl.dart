// ignore_for_file: unnecessary_lambdas

import '../../domain/entities/worker/worker_request.dart';
import '../../domain/repositories/workers_repository.dart';
import '../datasource/workers_datasource.dart';

class WorkersRepositoryImpl implements WorkersRepository {
  WorkersRepositoryImpl();

  final _source = WorkersDatasource();
  @override
  Future<String> createShop(WorkerRequest workerData) async {
    try {
      /* final shopId = await _source.createShopDS(shopData.toJson());
      await _source.addShopId(shopId);
      return shopId; */
      return '';
    } catch (e) {
      print('Error [creating shop] $e');
      return 'false';
    }
  }
}
