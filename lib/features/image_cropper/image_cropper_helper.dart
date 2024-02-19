import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';

import '../../theme/src/app_colors.dart';

@immutable
class ImageCropperHelper {
  static Future<CroppedFile?> cropImage(String path, bool isSquare) async {
    final imageCropped = await ImageCropper.platform.cropImage(
      aspectRatio:
          isSquare ? const CropAspectRatio(ratioX: 1, ratioY: 1) : const CropAspectRatio(ratioX: 9, ratioY: 16),
      compressQuality: 10,
      uiSettings: [
        AndroidUiSettings(
          showCropGrid: false,
          lockAspectRatio: true,
          hideBottomControls: true,
          toolbarColor: AppColors.secondary,
          toolbarWidgetColor: Colors.black,
        ),
        IOSUiSettings(
          title: 'Cropper',
        ),
      ],
      sourcePath: path,
    );
    return imageCropped;
  }
}
