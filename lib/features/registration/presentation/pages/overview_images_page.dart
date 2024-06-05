// lib/image_upload/image_upload_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../shared/custom_button.dart';
import '../../../../shared/custom_textfield_long.dart';
import '../../../../theme/src/app_colors.dart';
import '../providers/image_upload_provider.dart';
import '../providers/registration_controller.dart';
import 'payment_screen.dart';

class OverviewImagesPicker extends HookConsumerWidget {
  const OverviewImagesPicker({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final photoGridNotifier = ref.watch(photoGridProvider);
    final controller = useTextEditingController();

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
          resizeToAvoidBottomInset: false,
          body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 24),
              child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
                const SizedBox(height: 50),
                const Text(
                  'Select three images and write some overview description',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w100,
                  ),
                ),
                SizedBox(
                  height: 300,
                  child: GridView.builder(
                    itemCount: photoGridNotifier.photos!.length < 3
                        ? photoGridNotifier.photos!.length + 1
                        : photoGridNotifier.photos!.length,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 9 / 16,
                      crossAxisCount: 3,
                      crossAxisSpacing: 3,
                      mainAxisSpacing: 3,
                    ),
                    itemBuilder: (context, index) {
                      if (index == 0 && photoGridNotifier.photos!.length < 3) {
                        return InkWell(
                          onTap: () => ref.watch(photoGridProvider.notifier).selectImage(context, ref),
                          child: AspectRatio(
                              aspectRatio: 9 / 16,
                              child: Container(
                                  decoration: BoxDecoration(
                                      color: AppColors.secondary.withOpacity(0.6),
                                      borderRadius: BorderRadius.circular(10)),
                                  child: const Center(
                                      child: Icon(
                                    Icons.add,
                                    size: 30,
                                  )))),
                        );
                      } else {
                        return InkWell(
                          onTap: () {
                            showModalBottomSheet(
                                context: context,
                                backgroundColor: Colors.transparent,
                                builder: (context) => Container(
                                      height: 100,
                                      margin: const EdgeInsets.all(20),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: Container(
                                        padding: const EdgeInsets.all(20),
                                        child: Column(
                                          children: [
                                            InkWell(
                                              onTap: () {
                                                photoGridNotifier.removePhoto(
                                                    photoGridNotifier.photos!.length == 3 ? index : index - 1, ref);
                                                Navigator.pop(context);
                                              },
                                              child: const SizedBox(
                                                width: double.infinity,
                                                child: Text(
                                                  'remove photo',
                                                  style: TextStyle(fontSize: 18, color: Colors.red),
                                                ),
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ));
                          },
                          child: AspectRatio(
                            aspectRatio: 9 / 16,
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.transparent,
                                  border: Border.all(
                                    width: 5,
                                    color: AppColors.secondary,
                                  ),
                                  borderRadius: BorderRadius.circular(10)),
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(5),
                                  child: Image.file(
                                    photoGridNotifier.photos!.length == 3
                                        ? photoGridNotifier.photos![index]
                                        : photoGridNotifier.photos![index - 1],
                                    fit: BoxFit.fitHeight,
                                  )),
                            ),
                          ),
                        );
                      }
                    },
                  ),
                ),
                SizedBox(
                  height: 200,
                  child: CustomTextField(
                    controller: controller,
                    labelText: 'Overview description',
                    hintText: 'Overview description [Optional]',
                  ),
                ),
                const Spacer(),
                CustomButton(
                  text: 'Next',
                  onPressed: () {
                    print(controller.text);
                    ref.read(registrationControllerProvider.notifier).state =
                        ref.read(registrationControllerProvider)!.copyWith(overviewDescription: controller.text);

                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SubscriptionScreen()),
                    );
                  },
                  isDisabled: photoGridNotifier.photos?.isEmpty,
                  buttonColor: AppColors.secondary,
                  isExpanded: true,
                ),
                const SizedBox(
                  height: 8,
                ),
              ]))),
    );
  }
}
