import 'package:flutter/material.dart';

class CustomButtonWithWidget extends StatelessWidget {
  final Widget widget;
  final VoidCallback onPressed;
  final Color buttonColor;
  final Color textColor;
  final bool? isExpanded;
  final double? width;

  const CustomButtonWithWidget(
      {required this.widget,
      required this.onPressed,
      this.buttonColor = Colors.blue,
      this.textColor = Colors.white,
      this.isExpanded = false,
      this.width});

  @override
  Widget build(BuildContext context) => ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          foregroundColor: textColor,
          backgroundColor: buttonColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: SizedBox(
          width: isExpanded! ? (double.infinity) : (width != null ? width : (MediaQuery.sizeOf(context).width / 2)),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: Center(child: widget),
          ),
        ),
      );
}
