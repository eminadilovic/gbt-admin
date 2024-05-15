// ignore_for_file: unnecessary_lambdas

import '../../../../services/auth/backend/authenticator.dart';
import '../../domain/entities/shop/shop_request.dart';
import '../../domain/repositories/registration_repository.dart';
import '../datasource/registration_datasource.dart';

class RegistrationRepositoryImpl implements RegistrationRepository {
  RegistrationRepositoryImpl();

  final _source = RegistrationDatasource();
  @override
  Future<bool> createShop(ShopRequest shopData) async {
    try {
      final _userId = const Authenticator().userId.toString();
      return await _source.createShopDS(shopData.toJson(), _userId);
    } catch (e) {
      print('Error [creating shop] $e');
      return false;
    }
  }
}
