import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../image_cropper/image_cropper_helper.dart';
import '../../../image_picker/image_picker_helper.dart';

final selectedImageFileCropped = StateProvider.autoDispose<File?>((ref) => null);
final selectedOverviewImagesFilesCropped = StateProvider.autoDispose<List<File>>((ref) => []);

class PhotoGridNotifier extends ChangeNotifier {
  final List<File> _photos = [];
  List<File>? get photos => _photos;

  void removePhoto(int index, WidgetRef ref) {
    _photos.removeAt(index);
    ref.read(selectedOverviewImagesFilesCropped.notifier).state.removeAt(index);
    notifyListeners();
  }

  Future<void> selectImage(BuildContext context, WidgetRef ref) async {
    final picker = await ImagePickerHelper.pickImageFromGallery();
    if (picker != null) {
      final croppedImage = await ImageCropperHelper.cropImage(picker.path, false);
      if (croppedImage != null) {
        _photos.add(File(croppedImage.path));
        ref.read(selectedOverviewImagesFilesCropped.notifier).state.add(File(croppedImage.path));
      }
    }
    notifyListeners();
  }
}

final photoGridProvider = ChangeNotifierProvider((ref) => PhotoGridNotifier());
