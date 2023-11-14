import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../shared/custom_textfield.dart';
import '../../../theme/src/app_text_styles.dart';
import '../../router/route_names.dart';
import '../../shared/custom_button.dart';
import '../../shared/custom_button_with_widget.dart';
import '../../theme/src/app_colors.dart';

final shopNameControllerProvider = Provider<TextEditingController>((ref) => TextEditingController());
final ownerNameControllerProvider = Provider<TextEditingController>((ref) => TextEditingController());

var selectedCountryProvider = StateProvider<Country?>((ref) => null);

class RegistrationDetailsPage extends ConsumerWidget {
  const RegistrationDetailsPage({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) => Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          constraints: const BoxConstraints.expand(),
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/barbershopbg.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 150,
                ),
                Image.asset(
                  'assets/images/barberIcon.png',
                  height: MediaQuery.sizeOf(context).height / 10,
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'We are starting with some details...',
                  textAlign: TextAlign.center,
                  style: AppTextStyles.h3,
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomTextField(
                  labelText: 'Barber Shop name',
                  hintText: 'Barber Shop name',
                  controller: ref.watch(shopNameControllerProvider),
                  keyboardType: TextInputType.emailAddress,
                ),
                CustomTextField(
                  labelText: 'Owner name',
                  hintText: 'Owner name',
                  controller: ref.watch(ownerNameControllerProvider),
                ),
                const SizedBox(
                  height: 30,
                ),
                Center(
                  child: CustomButtonWithWidget(
                    isExpanded: true,
                    buttonColor: AppColors.transparentGray,
                    onPressed: () {
                      showCountryPicker(
                        context: context,
                        onSelect: (country) {
                          print('Select country: ${country.displayName}');
                          ref.read(selectedCountryProvider.notifier).update((state) => country);
                        },
                        // Optional. Sets the theme for the country list picker.
                        countryListTheme: CountryListThemeData(
                          // Optional. Sets the border radius for the bottomsheet.
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(40),
                            topRight: Radius.circular(40),
                          ),
                          // Optional. Styles the search field.
                          inputDecoration: const InputDecoration(
                            labelText: 'Search',
                            hintText: 'Start typing to search',
                            prefixIcon: Icon(Icons.search),
                          ),
                          searchTextStyle: AppTextStyles.h3.copyWith(color: AppColors.black),
                          textStyle: AppTextStyles.h3.copyWith(color: AppColors.black),
                        ),
                      );
                    },
                    widget: Row(
                      children: [
                        const Text('Select country'),
                        const SizedBox(
                          width: 30,
                        ),
                        if (ref.watch(selectedCountryProvider) == null)
                          const SizedBox()
                        else ...[
                          Text(ref.watch(selectedCountryProvider)!.flagEmoji),
                          Text(ref.watch(selectedCountryProvider)!.name),
                        ],
                        const Spacer(),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Spacer(),
                CustomButton(
                  text: 'Next',
                  onPressed: () {
                    GoRouter.of(context).pushNamed(
                      RouteNames.registrationDetails,
                    );
                  },
                  buttonColor: AppColors.secondary,
                  isExpanded: true,
                  isDisabled: ref.watch(ownerNameControllerProvider).text.isEmpty ||
                      ref.watch(shopNameControllerProvider).text.isEmpty ||
                      ref.watch(selectedCountryProvider) == null,
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
