// ignore_for_file: prefer_expression_function_bodies

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../theme/src/app_colors.dart';
import '../controllers/home_controller.dart';

class HomePage extends ConsumerWidget {
  HomePage({super.key});
  final List<Widget> children = [
    const Center(
        child: Text(
      '1',
      style: TextStyle(color: Colors.white, fontSize: 30),
    )),
    const Center(
        child: Text(
      '2',
      style: TextStyle(color: Colors.white, fontSize: 30),
    )),
    const Center(
        child: Text(
      '3',
      style: TextStyle(color: Colors.white, fontSize: 30),
    )),
    const Center(
        child: Text(
      '4',
      style: TextStyle(color: Colors.white, fontSize: 30),
    )),
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final movieListValue = ref.watch(homeControllerProvider);
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/barbershopbg.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: children[ref.watch(currentPageProvider)],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: ref.watch(currentPageProvider),
          type: BottomNavigationBarType.fixed,
          backgroundColor: AppColors.black.withOpacity(0.3),
          selectedItemColor: AppColors.secondary,
          unselectedItemColor: Colors.white.withOpacity(.60),
          unselectedFontSize: 14,
          onTap: (value) {
            ref.read(currentPageProvider.notifier).state = value;
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
