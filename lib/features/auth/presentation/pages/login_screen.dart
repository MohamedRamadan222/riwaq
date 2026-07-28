import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:riwaq/core/constants/app_colors.dart';
import 'package:riwaq/core/constants/app_styles.dart';
import 'package:riwaq/core/utils/widgets/custom_elevated_button.dart';
import 'package:riwaq/core/utils/widgets/custom_logo_rewaq.dart';
import 'package:riwaq/features/auth/presentation/widgets/login_form.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _controller = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            Gap(50),
            CustomLogoRiwaq(fontSize: 65, color: AppColors.primary),
            Gap(40),
            Text(
              'قم بتسجيل الدخول اللى حسابك',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
            ),
            Gap(30),
            LoginForm(
              passwordController: _controller,
              usernameController: _controller2,
            ),
            Gap(60),
            CustomElevatedButton(
              title: 'تسجيل الدخول',
              onPressed: () {
                // todo
              },
            ),
            Gap(25),
            Text(
              'او قم بتسجيل الدخول عبر',
              style: AppStyles.bold13.copyWith(
                fontSize: 11,
                color: Colors.grey[600],
              ),
            ),
            Gap(35),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 70),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _SocialIconButton(
                    icon: FontAwesomeIcons.google,
                    color: Colors.red.withAlpha(200),
                    onTap: () {},
                  ),
                  _SocialIconButton(
                    icon: FontAwesomeIcons.facebookF,
                    color: const Color(0xFF1877F2),
                    onTap: () {},
                  ),
                  _SocialIconButton(
                    icon: FontAwesomeIcons.apple,
                    color: Colors.black,
                    onTap: () {},
                  ),
                ],
              ),
            ),

            Gap(20),

            Padding(
              padding: const EdgeInsets.only(bottom: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'ليس لديك حساب؟',
                    style: AppStyles.bold13.copyWith(
                      fontSize: 13,
                      color: Colors.grey[600],
                    ),
                  ),
                  const Gap(4),
                  GestureDetector(
                    onTap: () {},
                    child: Text(
                      'إنشاء حساب',
                      style: AppStyles.bold13.copyWith(
                        fontSize: 13,
                        color: AppColors.primary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SocialIconButton extends StatelessWidget {
  final FaIconData icon;
  final Color color;
  final VoidCallback onTap;

  const _SocialIconButton({
    required this.icon,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.grey[300]!),
        ),
        child: Center(child: FaIcon(icon, color: color, size: 22)),
      ),
    );
  }
}
