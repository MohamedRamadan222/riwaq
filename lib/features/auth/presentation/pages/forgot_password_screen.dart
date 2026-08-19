import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:riwaq/core/utils/widgets/custom_elevated_button.dart';
import 'package:riwaq/features/auth/presentation/widgets/custom_text_field.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_styles.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Gap(10),
              Center(
                child: Text(
                  'نسيت كلمة المرور',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ),
              Gap(25),
              Text('البريد الإلكتروني', style: AppStyles.bold13),
              const Gap(8),
              CustomTextField(
                controller: _controller,
                hintText: 'expmramadan42@gmail.com',
                keyboardType: TextInputType.emailAddress,
              ),
              const Spacer(),
              CustomElevatedButton(
                title: 'ارسال',
                onPressed: () {
                  if (_controller.text.trim().isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          'من فضلك ادخل البريد الالكتروني',
                          textDirection: TextDirection.rtl,
                        ),
                      ),
                    );
                    return;
                  }
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        'تم ارسال رابط استعادة كلمة المرور الى بريدك',
                        textDirection: TextDirection.rtl,
                      ),
                    ),
                  );
                },
              ),
              Gap(25),
              Center(
                child: Text(
                  'او قم بتسجيل الدخول عبر',
                  style: AppStyles.bold13.copyWith(
                    fontSize: 11,
                    color: Colors.grey[600],
                  ),
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
                      onTap: () {
                        Navigator.pop(context);
                      },
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
