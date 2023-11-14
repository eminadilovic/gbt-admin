import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../router/route_names.dart';
import '../../../shared/custom_button.dart';
import '../../../shared/custom_button_with_widget.dart';
import '../../../theme/theme.dart';

class AuthPage extends ConsumerWidget {
  const AuthPage({
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
                Text(
                  'Welcome to The Global Barber Tool!',
                  textAlign: TextAlign.center,
                  style: AppTextStyles.h2,
                ),
                const Spacer(),
                Expanded(
                  child: CustomButtonWithWidget(
                    widget: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                      const Icon(
                        Icons.add_business,
                        size: 50,
                      ),
                      Text(
                        'Start with shop registration',
                        style: AppTextStyles.p6,
                      ),
                    ]),
                    onPressed: () {
                      GoRouter.of(context).pushNamed(RouteNames.login, extra: true);
                    },
                    buttonColor: const Color.fromARGB(88, 209, 216, 210),
                    isExpanded: true,
                  ),
                ),
                const Spacer(),
                FittedBox(
                  child: Text(
                    'If you have registrated your shop already, please Log In.',
                    textAlign: TextAlign.left,
                    style: AppTextStyles.p3,
                  ),
                ),
                CustomButton(
                  text: 'Log In',
                  onPressed: () {
                    GoRouter.of(context).pushNamed(
                      RouteNames.login,
                    );
                  },
                  buttonColor: AppColors.secondary,
                  isExpanded: true, // Customize the button color
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
