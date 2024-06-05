// ignore_for_file: prefer_expression_function_bodies

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../theme/src/app_colors.dart';
import '../controllers/home_controller.dart';

class HomePage extends ConsumerWidget {
  final Widget child;
  const HomePage({required this.child});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
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
          padding: const EdgeInsets.only(
            left: 12,
            right: 12,
          ),
          child: child,
        ),
        extendBody: true,
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: ref.watch(currentPageProvider),
          type: BottomNavigationBarType.fixed,
          backgroundColor: AppColors.black.withOpacity(0.5),
          selectedItemColor: AppColors.secondary,
          unselectedItemColor: Colors.white.withOpacity(.60),
          unselectedFontSize: 14,
          onTap: (value) {
            ref.read(currentPageProvider.notifier).state = value;

            switch (value) {
              case 0:
                return context.go('/workers');
              case 1:
                return context.go('/services');
              case 2:
                return context.go('/statistic');
              case 3:
                return context.go('/settings');
              default:
                return context.go('/dashboard');
            }
          },
          items: const [
            BottomNavigationBarItem(
              label: 'Workers',
              icon: Icon(Icons.people),
            ),
            BottomNavigationBarItem(
              label: 'Services',
              icon: Icon(Icons.checklist),
            ),
            BottomNavigationBarItem(
              label: 'Statistic',
              icon: Icon(Icons.percent),
            ),
            BottomNavigationBarItem(
              label: 'Settings',
              icon: Icon(Icons.settings),
            ),
          ],
        ),
      ),
    );
  }
}
