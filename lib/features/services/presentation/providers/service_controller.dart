import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';

import '../../../../services/auth/backend/authenticator.dart';
import '../../../image_uploader/image_uploader_helper.dart';
import '../../data/repositoriesImpl/servicesRepositoryImpl.dart';
import '../../domain/entities/service/service.dart';
import '../../domain/repositories/service_repository.dart';
import 'image_upload_provider.dart';

final serviceControllerProvider = StateNotifierProvider<ServicesController, AsyncValue<List<Service>>>((ref) {
  final servicesRepository = ServicesRepositoryImpl();

  return ServicesController(servicesRepository, ref);
});

class ServicesController extends StateNotifier<AsyncValue<List<Service>>> {
  ServicesController(this.serviceRepository, this.ref) : super(const AsyncValue.loading()) {
    _fetchServices();
  }
  final Ref ref;
  final ServicesRepository serviceRepository;

  Future<bool> addService(String title, String imagePath) async {
    final uploadedImage = await uploadImage(title);

    if (uploadedImage != null) {
      final service = Service(id: const Uuid().v4(), title: title, serviceImage: uploadedImage);

      final userId = const Authenticator().userId;
      if (userId == null) {
        return false;
      } else {
        final done = await serviceRepository.createService(service, userId);
        if (done) {
          state = state.whenData((currentServices) {
            final updatedServices = List<Service>.from(currentServices);
            updatedServices.add(service);
            return updatedServices;
          });
          return true;
        } else {
          return false;
        }
      }
    } else {
      return false;
    }
  }

  Future<bool> deleteService(String serviceId) async {
    final userId = const Authenticator().userId!;
    final done = await serviceRepository.deleteService(serviceId, userId);
    if (done) {
      state.value?.removeWhere((element) => element.id == serviceId);
      return true;
    } else {
      return false;
    }
  }

  Future<void> _fetchServices() async {
    try {
      final services = await serviceRepository.getServices();

      state = AsyncValue.data(services);
    } catch (error) {
      state = AsyncValue.error(error, StackTrace.current);
      print('Greška prilikom dohvata servisa: $error');
    }
  }

  Future<String?> uploadImage(String serviceTitle) async {
    try {
      final serviceImage = ref.read(serviceImageFileCropped);

      if (serviceImage == null) {
        return null;
      }
      String? serviceImageUrl;
      serviceImageUrl = await ImageUploaderHelper.uploadImage(
          serviceImage.path, '${const Authenticator().userId}/services', serviceTitle.trim().toLowerCase());
      return serviceImageUrl;
    } catch (e) {
      print('error $e');
      return null;
    }
  }
}
