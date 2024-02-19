import 'package:flutter/material.dart';

import '../theme/theme.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color buttonColor;
  final Color textColor;
  final bool? isExpanded;
  final bool? isDisabled;

  const CustomButton(
      {required this.text,
      required this.onPressed,
      this.buttonColor = Colors.blue,
      this.textColor = Colors.white,
      this.isExpanded = false,
      this.isDisabled = false});

  @override
  Widget build(BuildContext context) => ElevatedButton(
        onPressed: isDisabled! ? () {} : onPressed,
        style: ElevatedButton.styleFrom(
          foregroundColor: textColor,
          backgroundColor: isDisabled! ? AppColors.transparentGray : buttonColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: SizedBox(
          width: isExpanded! ? double.infinity : 200,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: Center(
              child: Text(
                text,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      );
}
