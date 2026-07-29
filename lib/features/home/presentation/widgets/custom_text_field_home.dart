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
      padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextFormField(
        controller: controller,
        textAlign: TextAlign.right,
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
          suffixIcon: Icon(CupertinoIcons.search, color: Colors.grey),
        ),
      ),
    );
  }
}
