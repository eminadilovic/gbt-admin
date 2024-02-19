import 'package:cloud_firestore/cloud_firestore.dart';

class RegistrationDatasource {
  RegistrationDatasource();

  Future<String> createShopDS(Map<String, dynamic> data) async {
    final shopId = await FirebaseFirestore.instance.collection('shops').add(data).then((value) => value.id);
    return shopId;
  }

  Future<void> addShopId(String shopId) async {
    await FirebaseFirestore.instance.collection('shops').doc(shopId).set(
      {
        'shop_id': shopId,
      },
      SetOptions(merge: true),
    );
  }
}
