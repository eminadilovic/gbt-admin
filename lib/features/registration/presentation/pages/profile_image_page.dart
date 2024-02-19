// lib/image_upload/image_upload_screen.dart
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../router/route_names.dart';
import '../../../../shared/custom_button.dart';
import '../../../../shared/custom_button_with_widget.dart';
import '../../../../theme/src/app_colors.dart';
import '../../../../theme/src/app_text_styles.dart';
import '../../../image_cropper/image_cropper_helper.dart';
import '../../../image_picker/image_picker_helper.dart';
import '../providers/image_upload_provider.dart';

class ProfileImagePicker extends ConsumerWidget {
  const ProfileImagePicker({
    super.key,
  });
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final photoProvider = ref.watch(selectedImageFileCropped);
    print('object');
    return Container(
      constraints: const BoxConstraints.expand(),
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/barbershopbg.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              Text(
                'Now please upload your shop logo..',
                textAlign: TextAlign.center,
                style: AppTextStyles.h3,
              ),
              const SizedBox(
                height: 20,
              ),
              Align(
                child: photoProvider != null
                    ? ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: SizedBox(
                          height: 200,
                          width: 200,
                          child: Image.file(
                            ref.read(selectedImageFileCropped.notifier).state!,
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                      )
                    : CustomButtonWithWidget(
                        widget: const SizedBox(
                          height: 200,
                          child: Icon(
                            Icons.add_a_photo,
                            size: 50,
                          ),
                        ),
                        padding: 0,
                        onPressed: () async {
                          final imageFile = await ImagePickerHelper.pickImageFromGallery();
                          if (imageFile == null) {
                            return;
                          } else {
                            final result = await ImageCropperHelper.cropImage(imageFile.path, true);

                            if (result != null) {
                              ref.read(selectedImageFileCropped.notifier).state = File(result.path);
                            }
                          }
                          print(ref.read(selectedImageFileCropped.notifier).state?.path);
                        },
                        buttonColor: const Color.fromARGB(88, 209, 216, 210),
                      ),
              ),
              TextButton(
                  onPressed: () {
                    ref.read(selectedImageFileCropped.notifier).state = null;
                  },
                  child: const Text('clear')),
              const Spacer(),
              CustomButton(
                text: 'Next',
                onPressed: () {
                  GoRouter.of(context).pushNamed(
                    RouteNames.overviewImagesPicker,
                  );
                },
                isDisabled: ref.watch(selectedImageFileCropped.notifier).state == null,
                buttonColor: AppColors.secondary,
                isExpanded: true,
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
