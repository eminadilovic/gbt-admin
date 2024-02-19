import 'dart:io' show File;

import 'package:flutter/foundation.dart' show immutable;
import 'package:image_picker/image_picker.dart';

@immutable
class ImagePickerHelper {
  static final ImagePicker _imagePicker = ImagePicker();
  static Future<File?> pickImageFromGallery() => _imagePicker
      .pickImage(source: ImageSource.gallery)
      .then((xFile) => xFile?.path)
      .then((filePath) => filePath != null ? File(filePath) : null);

  static Future<File?> pickVideoFromGallery() => _imagePicker
      .pickVideo(source: ImageSource.gallery)
      .then((xFile) => xFile?.path)
      .then((filePath) => filePath != null ? File(filePath) : null);
}
