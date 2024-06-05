import 'package:flutter/material.dart';

import '../theme/src/app_text_styles.dart';

class CustomTextField extends StatelessWidget {
  final String labelText;
  final String hintText;
  final TextEditingController? controller;
  final bool obscureText;
  final bool? showLabel;
  final TextInputType keyboardType;
  @override
  final Key? key;
  final void Function(String)? onChange;
  const CustomTextField(
      {required this.labelText,
      required this.hintText,
      this.controller,
      this.showLabel,
      this.key,
      this.obscureText = false,
      this.keyboardType = TextInputType.text,
      this.onChange});

  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Column(
          children: [
            if (showLabel != null && showLabel!)
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  labelText,
                  style: AppTextStyles.h3,
                ),
              ),
            TextField(
              controller: controller,
              obscureText: obscureText,
              keyboardType: keyboardType,
              onChanged: onChange,
              key: key,
              decoration: InputDecoration(
                hintText: hintText,
                hintStyle: const TextStyle(color: Colors.white54),
                filled: true,
                fillColor: Colors.white.withOpacity(0.4),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ],
        ),
      );
}
