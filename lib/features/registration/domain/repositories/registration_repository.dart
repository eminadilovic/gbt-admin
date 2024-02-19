import '../entities/shop/shop_request.dart';

abstract class RegistrationRepository {
  Future<String> createShop(ShopRequest shopData);
}
