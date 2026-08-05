import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:riwaq/core/constants/app_colors.dart';
import 'package:riwaq/core/di/injection_container.dart';
import 'package:riwaq/core/utils/widgets/custom_elevated_button.dart';
import 'package:riwaq/core/utils/widgets/custom_logo_rewaq.dart';
import 'package:riwaq/features/auth/presentation/cubit/login_cubit.dart';
import 'package:riwaq/features/auth/presentation/cubit/login_state.dart';
import 'package:riwaq/features/auth/presentation/widgets/login_form.dart';

import '../../../home/presentation/pages/main_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<LoginCubit>(),
      child: Scaffold(
        backgroundColor: AppColors.white,
        body: BlocConsumer<LoginCubit, LoginState>(
          listener: (context, state) {
            if (state is LoginError) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(state.message)));
            }
            if (state is LoginSuccess) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => MainScreen()),
              );
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text('تم تسجيل الدخول بنجاح!')));
            }
          },
          builder: (context, state) {
            final isLoading = state is LoginLoading;

            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  Gap(50),
                  CustomLogoRiwaq(fontSize: 65, color: AppColors.primary),
                  Gap(40),
                  Text(
                    'قم بتسجيل الدخول الى حسابك',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                  ),
                  Gap(30),
                  LoginForm(
                    passwordController: _passwordController,
                    usernameController: _usernameController,
                  ),
                  Gap(60),
                  isLoading
                      ? const CircularProgressIndicator()
                      : CustomElevatedButton(
                          title: 'تسجيل الدخول',
                          onPressed: () {
                            context.read<LoginCubit>().login(
                              username: _usernameController.text.trim(),
                              password: _passwordController.text.trim(),
                            );
                          },
                        ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
