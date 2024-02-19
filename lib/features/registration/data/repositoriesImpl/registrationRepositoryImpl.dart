// ignore_for_file: unnecessary_lambdas

import '../../domain/entities/shop/shop_request.dart';
import '../../domain/repositories/registration_repository.dart';
import '../datasource/registration_datasource.dart';

class RegistrationRepositoryImpl implements RegistrationRepository {
  RegistrationRepositoryImpl();

  final _source = RegistrationDatasource();
  @override
  Future<String> createShop(ShopRequest shopData) async {
    try {
      final shopId = await _source.createShopDS(shopData.toJson());
      await _source.addShopId(shopId);
      return shopId;
    } catch (e) {
      print('Error [creating shop] $e');
      return 'false';
    }
  }
}
