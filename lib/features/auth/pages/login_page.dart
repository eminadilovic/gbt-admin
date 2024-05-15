import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../router/route_names.dart';
import '../../../services/auth/firebase_auth.dart';
import '../../../shared/custom_button.dart';
import '../../../shared/custom_button_with_widget.dart';
import '../../../shared/custom_textfield.dart';
import '../../../theme/src/app_colors.dart';
import '../../../theme/src/app_text_styles.dart';
import '../controllers/auth_page_controller.dart';

class LoginPage extends ConsumerWidget {
  final bool isRegistration;
  const LoginPage({
    this.isRegistration = false,
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    @override
    final controller = ref.watch(authControllerProvider);

    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    return Scaffold(
      //resizeToAvoidBottomInset: false,
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
              if (isRegistration) ...[
                Text(
                  'First we need from you to registrate your credentials, and then continue with the registration steps',
                  textAlign: TextAlign.center,
                  style: AppTextStyles.h3,
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
              CustomTextField(
                labelText: 'Email',
                hintText: 'Enter your email',
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
              ),
              CustomTextField(
                labelText: 'Password',
                hintText: 'Enter your password',
                controller: passwordController,
                obscureText: true,
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomButtonWithWidget(
                    onPressed: () {
                      FirebaseAuthService(FirebaseAuth.instance).signInWithGoogle().then((value) {
                        print('1');

                        if (value != null) {
                          print('2');
                          GoRouter.of(context).pushNamed(
                            RouteNames.registrationDetails,
                          );
                        }
                      });
                    },
                    width: 30,
                    buttonColor: AppColors.transparentGray,
                    widget: SizedBox(
                      width: 50,
                      child: Image.asset('assets/icons/google_bw_logo.png'),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  CustomButtonWithWidget(
                    onPressed: () {
                      FirebaseAuthService(FirebaseAuth.instance).signInWithGoogle().then((value) {
                        if (value != null) {
                          GoRouter.of(context).pushNamed(
                            RouteNames.registrationDetails,
                          );
                        }
                      });
                    },
                    width: 30,
                    buttonColor: AppColors.transparentGray,
                    widget: SizedBox(
                      width: 50,
                      child: Image.asset('assets/icons/apple_bw_logo.png'),
                    ),
                  )
                ],
              ),
              const Spacer(),
              CustomButton(
                text: isRegistration ? 'Registrate' : 'Sign In',
                onPressed: () {
                  if (isRegistration) {
                    GoRouter.of(context).pushNamed(
                      RouteNames.registrationDetails,
                    );
                  } else {
                    GoRouter.of(context).pushNamed(
                      RouteNames.registrationDetails,
                    );
                  }
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
    );
  }
}
