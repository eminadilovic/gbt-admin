import '../entities/shop/shop_request.dart';

abstract class RegistrationRepository {
  Future<bool> createShop(ShopRequest shopData);
}
