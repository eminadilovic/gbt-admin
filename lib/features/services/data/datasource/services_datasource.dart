import 'package:cloud_firestore/cloud_firestore.dart';

import '../../domain/entities/service/service.dart';

class ServicesDatasource {
  ServicesDatasource();

  Future<bool> addService(String serviceId, Map<String, dynamic> data, String userId) async {
    try {
      await FirebaseFirestore.instance.collection('shops').doc(userId).collection('services').doc(serviceId).set(data);
      return true;
    } catch (e) {
      print('error: $e');
      return false;
    }
  }

  Future<bool> deleteService(String serviceId, String userId) async {
    try {
      await FirebaseFirestore.instance.collection('shops').doc(userId).collection('services').doc(serviceId).delete();
      return true;
    } catch (e) {
      print('error: $e');
      return false;
    }
  }

  Future<List<Service>> getServices(String userId) async {
    try {
      final QuerySnapshot querySnapshot =
          await FirebaseFirestore.instance.collection('shops').doc(userId).collection('services').get();

      final services = querySnapshot.docs.map((doc) => Service.fromJson(doc.data()! as Map<String, dynamic>)).toList();

      return services;
    } catch (e) {
      print('error: $e');
      return [];
    }
  }
}
