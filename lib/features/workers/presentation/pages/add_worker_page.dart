// ignore_for_file: prefer_expression_function_bodies, use_build_context_synchronously

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:uuid/uuid.dart';

import '../../../../shared/custom_button.dart';
import '../../../../shared/custom_button_with_widget.dart';
import '../../../../shared/custom_textfield.dart';
import '../../../../theme/src/app_colors.dart';
import '../../../../theme/src/app_text_styles.dart';
import '../../../image_cropper/image_cropper_helper.dart';
import '../../../image_picker/image_picker_helper.dart';
import '../providers/add_worker_provider.dart';
import '../providers/image_upload_provider.dart';
import '../providers/workers_controller.dart';

class AddWorkerPage extends HookConsumerWidget {
  const AddWorkerPage({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final photoProvider = ref.watch(workerImageFileCropped);
    final workerController = ref.watch(workersControllerProvider.notifier);
    final workerNameController = useTextEditingController(text: '');
    final workerTitleController = useTextEditingController(text: '');
    final _areFieldsEmpty = useState<bool>(true); // controll the button based on Text.isEmpty
    final _loading = useState<bool>(false);

    bool areFieldsEmpty() =>
        workerNameController.text.toString().isEmpty || workerTitleController.text.toString().isEmpty;

    useMemoized(() {
      workerNameController.addListener(() {
        _areFieldsEmpty.value = areFieldsEmpty();
      });

      workerTitleController.addListener(() {
        _areFieldsEmpty.value = areFieldsEmpty();
      });
    });
    print('reeeeeeeee');
    return Scaffold(
      backgroundColor: Colors.transparent,
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.all(20).copyWith(top: 50, bottom: 0),
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
                      'Insert worker data and upload his photo',
                      textAlign: TextAlign.left,
                      style: AppTextStyles.h3,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomTextField(
                      labelText: 'Full Name',
                      showLabel: true,
                      hintText: 'eg. John Cena',
                      controller: workerNameController,
                    ),
                    CustomTextField(
                      labelText: 'Title/Description',
                      showLabel: true,
                      hintText: 'eg. Senior Barber',
                      controller: workerTitleController,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Upload worker photo, it will be shown to users during booking',
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
                                  ref.read(workerImageFileCropped.notifier).state!,
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
                                    ref.read(workerImageFileCropped.notifier).state = File(result.path);
                                  }
                                }
                                print(ref.read(workerImageFileCropped.notifier).state?.path);
                              },
                              buttonColor: const Color.fromARGB(88, 209, 216, 210),
                            ),
                    ),
                    TextButton(
                        onPressed: () {
                          ref.read(workerImageFileCropped.notifier).state = null;
                        },
                        child: const Text('clear')),
                    CustomButton(
                      text: 'Add worker',
                      onPressed: () async {
                        final newRequest = ref.read(addWorkerProvider).copyWith(
                            name: workerNameController.text,
                            title: workerTitleController.text,
                            profileImage: ref.read(workerImageFileCropped)!.path,
                            userId: const Uuid().v4());

                        ref.read(addWorkerProvider.notifier).updateWorker(newRequest);

                        _loading.value = true;
                        final done = await workerController.addWorker(newRequest);
                        if (done != null && done == true) {
                          context.pop();
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              backgroundColor: Colors.green.shade400,
                              content: const Text('Worker added! Now add services for this worker'),
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
                      isDisabled: ref.watch(workerImageFileCropped.notifier).state == null || areFieldsEmpty(),
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
