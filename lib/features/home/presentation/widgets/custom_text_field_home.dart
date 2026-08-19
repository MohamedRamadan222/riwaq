import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';

class CustomTextFieldHome extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;

  const CustomTextFieldHome({
    super.key,
    required this.controller,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.fieldBorder, width: 1),
      ),
      child: TextFormField(
        controller: controller,
        textAlign: TextAlign.right,
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          letterSpacing: 1,
        ),
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hintText,
          hintTextDirection: TextDirection.rtl,
          hintStyle: const TextStyle(color: AppColors.textHint, fontSize: 12),
          suffixIcon: Icon(CupertinoIcons.search, color: Colors.grey),
          contentPadding: const EdgeInsets.symmetric(vertical: 15),
        ),
      ),
    );
  }
}
