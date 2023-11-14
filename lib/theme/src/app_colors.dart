import 'package:flutter/material.dart';

class AppColors {
  static const Color primary = Color.fromARGB(255, 81, 53, 255);
  static const Color primaryDark = Color.fromARGB(255, 1, 0, 128);
  static const Color secondary = Color(0xffAE8826);
  static const Color text = Color.fromARGB(255, 245, 245, 245);
  static const Color background = Color(0xfff2f2f2);
  static const Color white = Color(0xffffffff);
  static const Color lightGray = Color(0xffcccccc);
  static const Color darkerGray = Color(0xFFD3D3D3);
  static Color transparentGray = Colors.white.withOpacity(0.4);
  static const Color black = Color.fromARGB(255, 0, 0, 0);

  static const LinearGradient primaryGradient = LinearGradient(
    begin: AlignmentDirectional.centerStart,
    end: AlignmentDirectional.centerEnd,
    colors: [
      primary,
      primaryDark,
    ],
  );
}
