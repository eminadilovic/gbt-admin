// ignore_for_file: unnecessary_lambdas

import '../../../../services/auth/backend/authenticator.dart';
import '../../domain/entities/service/service.dart';
import '../../domain/repositories/service_repository.dart';
import '../datasource/services_datasource.dart';

class ServicesRepositoryImpl implements ServicesRepository {
  ServicesRepositoryImpl();

  final _source = ServicesDatasource();
  @override
  Future<bool> createService(Service service, String userId) async {
    try {
      return await _source.addService(service.id, service.toJson(), userId);
    } catch (e) {
      print('Error [creating service] $e');
      return false;
    }
  }

  @override
  Future<bool> deleteService(String serviceId, String userId) async {
    try {
      return await _source.deleteService(serviceId, userId);
    } catch (e) {
      print('Error [creating service] $e');
      return false;
    }
  }

  @override
  Future<List<Service>> getServices() async {
    try {
      final userId = const Authenticator().userId;
      if (userId == null) {
        return Future.value([]);
      }
      return await _source.getServices(userId);
    } catch (e) {
      print('Error [creating service] $e');
      return Future.value([]);
    }
  }
}
