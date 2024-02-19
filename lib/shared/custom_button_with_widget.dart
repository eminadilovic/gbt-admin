import 'package:flutter/material.dart';

class CustomButtonWithWidget extends StatelessWidget {
  final Widget widget;
  final VoidCallback onPressed;
  final Color buttonColor;
  final Color textColor;
  final Color? borderColor;
  final bool? isExpanded;
  final double? width;
  final double? padding;

  const CustomButtonWithWidget(
      {required this.widget,
      required this.onPressed,
      this.buttonColor = Colors.blue,
      this.textColor = Colors.white,
      this.borderColor,
      this.isExpanded = false,
      this.padding,
      this.width});

  @override
  Widget build(BuildContext context) => ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          foregroundColor: textColor,
          backgroundColor: buttonColor,
          side: borderColor == null ? null : BorderSide(color: borderColor!, width: 2),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: SizedBox(
          width: isExpanded! ? (double.infinity) : (width ?? (MediaQuery.sizeOf(context).width / 2)),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: padding ?? 12.0),
            child: Center(child: widget),
          ),
        ),
      );
}
