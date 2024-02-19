import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

@immutable
class ImageUploaderHelper {
  static Future<String?> uploadImage(String path, String folderName, String fileName) async {
    try {
      await Firebase.initializeApp();

      final storageReference = FirebaseStorage.instance.ref().child('$folderName/$fileName');

      final file = File(path);

      final metadata = SettableMetadata(
        contentType: 'image/jpeg', // Adjust the content type as needed
      );

      await storageReference.putFile(file, metadata);

      final downloadURL = await storageReference.getDownloadURL();

      return downloadURL;
    } catch (e) {
      print('Error uploading image: $e');
      return null;
    }
  }
}
