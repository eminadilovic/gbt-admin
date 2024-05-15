class WorkersDatasource {
  WorkersDatasource();

  /* Future<String> addWorker(Map<String, dynamic> data) async {
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
  } */
}
