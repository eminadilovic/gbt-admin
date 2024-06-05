// ignore_for_file: prefer_expression_function_bodies, use_build_context_synchronously

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../shared/custom_button.dart';
import '../../../../shared/custom_button_with_widget.dart';
import '../../../../shared/custom_textfield.dart';
import '../../../../theme/src/app_colors.dart';
import '../../../../theme/src/app_text_styles.dart';
import '../../../image_cropper/image_cropper_helper.dart';
import '../../../image_picker/image_picker_helper.dart';
import '../providers/image_upload_provider.dart';
import '../providers/service_controller.dart';

class AddServicePage extends HookConsumerWidget {
  const AddServicePage({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final photoProvider = ref.watch(serviceImageFileCropped);
    final serviceNameController = useTextEditingController(text: '');
    final _areFieldsEmpty = useState<bool>(true); // controll the button based on Text.isEmpty
    final _loading = useState<bool>(false);

    bool areFieldsEmpty() => serviceNameController.text.toString().isEmpty;

    final serviceController = ref.read(serviceControllerProvider.notifier);
    useMemoized(() {
      serviceNameController.addListener(() {
        _areFieldsEmpty.value = areFieldsEmpty();
      });
    });
    return Container(
      constraints: const BoxConstraints.expand(),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        resizeToAvoidBottomInset: false,
        body: Padding(
          padding: const EdgeInsets.all(20).copyWith(top: 50),
          child: _loading.value
              ? const Center(
                  child: SizedBox(
                      width: 200,
                      height: 200,
                      child: CircularProgressIndicator(
                        color: AppColors.secondary,
                      )),
                )
              : SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () => context.pop(),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            const Icon(
                              Icons.arrow_back_ios_new,
                              color: Colors.white,
                            ),
                            Text(
                              'go back',
                              textAlign: TextAlign.left,
                              style: AppTextStyles.p1,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Type a title and upload some image of the service...',
                        textAlign: TextAlign.left,
                        style: AppTextStyles.h3,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomTextField(
                        labelText: 'title',
                        hintText: 'eg. beard shaving and hair styling',
                        controller: serviceNameController,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Upload service image, try to show exactly action',
                        textAlign: TextAlign.left,
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
                                    ref.read(serviceImageFileCropped.notifier).state!,
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
                                      ref.read(serviceImageFileCropped.notifier).state = File(result.path);
                                    }
                                  }
                                  print(ref.read(serviceImageFileCropped.notifier).state?.path);
                                },
                                buttonColor: const Color.fromARGB(88, 209, 216, 210),
                              ),
                      ),
                      TextButton(
                          onPressed: () {
                            ref.read(serviceImageFileCropped.notifier).state = null;
                          },
                          child: const Text('clear')),
                      CustomButton(
                        text: 'Add service',
                        onPressed: () async {
                          _loading.value = true;
                          final done = await serviceController.addService(
                              serviceNameController.text, ref.read(serviceImageFileCropped)!.path);
                          if (done) {
                            context.pop();
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                backgroundColor: Colors.green.shade400,
                                content: const Text('Service added!'),
                              ),
                            );
                          } else {
                            context.pop();
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                backgroundColor: Colors.red.shade400,
                                content: const Text('Something went wrong, try later!'),
                              ),
                            );
                          }
                          _loading.value = false;
                        },
                        isDisabled: ref.watch(serviceImageFileCropped.notifier).state == null || areFieldsEmpty(),
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
      ),
    );
  }
}
