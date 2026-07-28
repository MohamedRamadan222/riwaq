import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';

class HomeSearchField extends StatelessWidget {
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;

  const HomeSearchField({super.key, this.controller, this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: AppColors.star,
        borderRadius: BorderRadius.circular(14),
      ),
      child: TextFormField(
        controller: controller,
        onChanged: onChanged,
        textAlign: TextAlign.right,
        style: const TextStyle(fontSize: 14),
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: 'ابحث عن كتاب، مؤلف أو دار...',
          hintTextDirection: TextDirection.rtl,
          hintStyle: const TextStyle(color: AppColors.textHint, fontSize: 14),
          prefixIcon: const Icon(Icons.search, color: AppColors.textHint),
        ),
      ),
    );
  }
}
