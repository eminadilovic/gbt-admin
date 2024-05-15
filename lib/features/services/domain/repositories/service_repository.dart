import '../entities/service/service.dart';

abstract class ServicesRepository {
  Future<bool> createService(Service serviceData, String userId);
  Future<bool> deleteService(String serviceId, String userId);
  Future<List<Service>> getServices();
}
