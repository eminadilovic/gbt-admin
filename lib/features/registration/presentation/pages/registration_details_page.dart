import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../shared/custom_textfield.dart';
import '../../../../../theme/src/app_text_styles.dart';
import '../../../../router/route_names.dart';
import '../../../../shared/custom_button.dart';
import '../../../../shared/custom_button_with_widget.dart';
import '../../../../theme/src/app_colors.dart';
import '../providers/registration_controller.dart';

class RegistrationDetailsPage extends HookConsumerWidget {
  const RegistrationDetailsPage({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final shopNameController = useTextEditingController(text: '');
    final ownerNameController = useTextEditingController(text: '');
    final townController = useTextEditingController(text: '');
    final selectedCountry = useState<Country?>(null);

    final _areFieldsEmpty = useState<bool>(true); // controll the button based on Text.isEmpty

    bool areFieldsEmpty() =>
        shopNameController.text.toString().isEmpty ||
        ownerNameController.text.toString().isEmpty ||
        townController.text.toString().isEmpty ||
        selectedCountry.value == null;

    useMemoized(() {
      shopNameController.addListener(() {
        _areFieldsEmpty.value = areFieldsEmpty();
      });
      ownerNameController.addListener(() {
        _areFieldsEmpty.value = areFieldsEmpty();
      });
      townController.addListener(() {
        _areFieldsEmpty.value = areFieldsEmpty();
      });
      selectedCountry.addListener(() {
        _areFieldsEmpty.value = areFieldsEmpty();
      });

      return null;
    }, [shopNameController, ownerNameController, townController]);

    print(ref.read(registrationControllerProvider.notifier).state);

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
          child: SingleChildScrollView(
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
                  controller: shopNameController,
                ),
                CustomTextField(
                  labelText: 'Owner name',
                  hintText: 'Owner name',
                  controller: ownerNameController,
                ),
                const SizedBox(
                  height: 10,
                ),
                Center(
                  child: CustomButtonWithWidget(
                    isExpanded: true,
                    buttonColor: AppColors.transparentGray,
                    borderColor: AppColors.secondary,
                    onPressed: () {
                      showCountryPicker(
                        context: context,
                        onSelect: (country) {
                          print('Select country: ${country.displayName}');
                          selectedCountry.value = country;
                        },
                        countryListTheme: CountryListThemeData(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(40),
                            topRight: Radius.circular(40),
                          ),
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
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Spacer(),
                        if (selectedCountry.value == null)
                          const Text('Select country', style: TextStyle(color: Colors.white54))
                        else ...[
                          Text(
                            selectedCountry.value!.flagEmoji,
                            style: const TextStyle(fontSize: 30),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Text(selectedCountry.value!.name),
                        ],
                        const Spacer(),
                        Container(
                          child: const Icon(
                            Icons.arrow_drop_down,
                            size: 30,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomTextField(
                  labelText: 'Town',
                  hintText: 'Town',
                  controller: townController,
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomButton(
                  text: 'Next',
                  onPressed: () {
                    ref.read(registrationControllerProvider.notifier).state = ref
                        .read(registrationControllerProvider)!
                        .copyWith(
                            barberShopName: shopNameController.text,
                            ownerName: ownerNameController.text,
                            countryCode: selectedCountry.value!.countryCode,
                            townName: townController.text);
                    GoRouter.of(context).pushNamed(
                      RouteNames.profileImagePicker,
                    );
                  },
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
