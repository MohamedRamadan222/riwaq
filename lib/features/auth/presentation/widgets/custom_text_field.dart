import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final TextInputType? keyboardType;

  const CustomTextField({
    super.key,
    required this.controller,
    required this.hintText,
    this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 1),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.fieldBorder, width: 1),
        color: AppColors.white,
        borderRadius: BorderRadius.circular(14),
      ),
      child: TextFormField(
        controller: controller,
        textAlign: TextAlign.right,
        keyboardType: keyboardType ?? TextInputType.text,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          letterSpacing: 3,
        ),
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hintText,
          hintTextDirection: TextDirection.rtl,
          hintStyle: const TextStyle(color: AppColors.textHint, fontSize: 12),
        ),
      ),
    );
  }
}
