import 'package:cloud_firestore/cloud_firestore.dart';

class RegistrationDatasource {
  RegistrationDatasource();

  Future<bool> createShopDS(Map<String, dynamic> data, String userId) async {
    final DocumentReference userDocRef = FirebaseFirestore.instance.collection('shops').doc(userId);
    final docSnapshot = await userDocRef.get();

    if (docSnapshot.exists) {
      print('This user has registrated shop already');
      return false;
    } else {
      await userDocRef.set(data);
      return true;
    }
  }
}
