import 'package:cloud_firestore/cloud_firestore.dart';

import '../../domain/entities/worker/worker_request.dart';

class WorkersDatasource {
  WorkersDatasource();

  Future<bool> addWorker(String workerId, Map<String, dynamic> data, String userId) async {
    try {
      await FirebaseFirestore.instance.collection('shops').doc(userId).collection('workers').doc(workerId).set(data);
      return true;
    } catch (e) {
      print('error: $e');
      return false;
    }
  }

  Future<bool> deleteWorker(String workerId, String userId) async {
    try {
      await FirebaseFirestore.instance.collection('shops').doc(userId).collection('workers').doc(workerId).delete();
      return true;
    } catch (e) {
      print('error: $e');
      return false;
    }
  }

  Future<List<WorkerRequest>> getWorkers(String userId) async {
    try {
      final QuerySnapshot querySnapshot =
          await FirebaseFirestore.instance.collection('shops').doc(userId).collection('workers').get();

      final workers =
          querySnapshot.docs.map((doc) => WorkerRequest.fromJson(doc.data()! as Map<String, dynamic>)).toList();

      return workers;
    } catch (e) {
      print('error: $e');
      return [];
    }
  }
}
