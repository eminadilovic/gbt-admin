import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lottie/lottie.dart';

import '../../../../router/route_names.dart';
import '../../../auth/controllers/shop_controller.dart';

class SuccessPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final shopDataState = ref.watch(shopDataProvider);

    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/barbershopbg.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: shopDataState.when(
            loading: () => const CircularProgressIndicator(color: Colors.green),
            data: (shopData) {
              if (shopData != null) {
                Future.delayed(const Duration(seconds: 3), () {
                  /*  GoRouter.of(context).pushNamed(
                    RouteNames.home,
                  );*/

                  while (GoRouter.of(context).canPop()) {
                    GoRouter.of(context).pop();
                  }

                  GoRouter.of(context).replaceNamed(
                    RouteNames.home,
                  );
                });
                return SuccessAnimation();
              } else {
                return const Text('Shop data not available');
              }
            },
            error: (error, stackTrace) => Text('Error: $error'),
          ),
        ),
      ),
    );
  }
}

class SuccessAnimation extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(
            'assets/lotties/success_animation.json',
            width: 200,
            height: 200,
            repeat: false,
            animate: true,
          ),
          const SizedBox(height: 20),
          const Text(
            'Registration Successful!',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      );
}
