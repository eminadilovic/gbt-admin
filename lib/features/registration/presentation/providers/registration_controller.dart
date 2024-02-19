import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../services/auth/backend/authenticator.dart';
import '../../../image_uploader/image_uploader_helper.dart';
import '../../data/repositoriesImpl/registrationRepositoryImpl.dart';
import '../../domain/entities/shop/shop_request.dart';
import '../../domain/repositories/registration_repository.dart';
import 'image_upload_provider.dart';

final registrationControllerProvider = StateNotifierProvider<RegistrationController, ShopRequest?>((ref) {
  final registrationRepository = RegistrationRepositoryImpl();

  return RegistrationController(registrationRepository, ref);
});

class RegistrationController extends StateNotifier<ShopRequest?> {
  RegistrationController(this.registrationRepository, this.ref) : super(null) {
    state = ShopRequest(
        userId: const Authenticator().userId ?? '',
        barberShopName: '',
        ownerName: '',
        countryCode: '',
        townName: '',
        profileImage: '',
        subscriptions: []);
  }
  final Ref ref;
  final RegistrationRepository registrationRepository;

  Future<String?> createShop() async {
    if (state != null) {
      final uploadedImages = await uploadImages();
      if (uploadedImages) {
        final shopId = await registrationRepository.createShop(state!);
        return shopId;
      } else {
        return null;
      }
    } else {
      print('state je null');
      return null;
    }
  }

  Future<bool> uploadImages() async {
    try {
      if (state == null) return false;

      final profileImage = ref.read(selectedImageFileCropped);
      final overviewImages = ref.read(photoGridProvider).photos;
      final shopNameTrimmed = state == null ? '' : state?.barberShopName.replaceAll(RegExp(r'\s+'), '');

      String? profileImageUrl;
      final overviewImagesUrl = <String>[];
      print('idemo sa upload slike');

      if (profileImage != null) {
        profileImageUrl = await ImageUploaderHelper.uploadImage(
            profileImage.path, '${state!.userId}_${shopNameTrimmed!.toLowerCase()}', 'profileImage');
      }

      if (overviewImages != null && overviewImages.isNotEmpty) {
        for (var i = 0; i < overviewImages.length; i++) {
          final overviewImage = await ImageUploaderHelper.uploadImage(overviewImages[i].path,
                  '${state!.userId}_${shopNameTrimmed?.toLowerCase()}', 'overviewImage_${i + 1}') ??
              '';
          overviewImagesUrl.add(overviewImage);
        }
      }

      state = state?.copyWith(profileImage: profileImageUrl ?? '', overviewImages: overviewImagesUrl);

      return true;
    } catch (e) {
      print('error $e');
      return false;
    }
  }
}
