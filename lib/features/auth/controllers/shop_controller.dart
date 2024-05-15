import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../services/auth/backend/authenticator.dart';
import '../../registration/presentation/providers/registration_controller.dart';
import '../entities/shop_data.dart';

final shopDataProvider = AsyncNotifierProvider<ShopDataNotifierController, ShopData?>(ShopDataNotifierController.new);

class ShopDataNotifierController extends AsyncNotifier<ShopData?> {
  ShopDataNotifierController() : super();

  void updateShopData(ShopData shopData) {
    state = AsyncValue.data(shopData);
  }

  void clearShopData() {
    state = const AsyncValue.data(null);
  }

  Future<ShopData?> getShopData() async {
    final success = await ref.read(registrationControllerProvider.notifier).createShop();

    if (success) {
      final result = await ShopDataService().getShopData(const Authenticator().userId.toString());
      return result!;
    }
    return null;
  }

  @override
  FutureOr<ShopData?> build() async => await getShopData();
}

class ShopDataService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<ShopData?> getShopData(String userId) async {
    try {
      final documentSnapshot = await _firestore.collection('shops').doc(userId).get();
      if (documentSnapshot.exists) {
        return ShopData.fromFirestore(documentSnapshot);
      } else {
        print('Getting document is not enable');

        return null;
      }
    } catch (error) {
      // Handle error
      print('Error fetching shop data: $error');
      return null;
    }
  }
}
