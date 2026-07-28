import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_styles.dart';


class LoginForm extends StatelessWidget {
  final TextEditingController usernameController;
  final TextEditingController passwordController;

  const LoginForm({
    super.key,
    required this.usernameController,
    required this.passwordController,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text('البريد الإلكتروني', style: AppStyles.bold13),
        const Gap(8),
        _buildTextField(
          controller: usernameController,
          hintText: 'sara@example.com',
          isPassword: false,
        ),
        const Gap(20),
        Text('كلمة المرور', style: AppStyles.bold13),
        const Gap(8),
        _buildTextField(
          controller: passwordController,
          hintText: 'كلمة المرور',
          isPassword: true,
        ),
        const Gap(8),
        Text(
          'نسيت كلمة المرور؟',
          style: AppStyles.bold13.copyWith(color: AppColors.primary),
        ),
      ],
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String hintText,
    required bool isPassword,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.fieldBorder, width: 1),
        color: AppColors.white,
        borderRadius: BorderRadius.circular(14),
      ),
      child: TextFormField(
        controller: controller,
        textAlign: TextAlign.right,
        obscureText: isPassword,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          letterSpacing: 3,
        ),
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hintText,
          hintTextDirection: TextDirection.rtl,
          hintStyle: const TextStyle(color: AppColors.textHint, fontSize: 14),
          suffixIcon: isPassword
              ? const Icon(
            Icons.remove_red_eye_outlined,
            color: AppColors.textHint,
          )
              : null,
        ),
      ),
    );
  }
}