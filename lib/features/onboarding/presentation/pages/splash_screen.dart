import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'package:riwaq/core/constants/app_colors.dart';
import 'package:riwaq/features/onboarding/presentation/pages/on_boarding_screen.dart';

import '../../../../core/utils/widgets/custom_logo_rewaq.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 4), () {
      if (!mounted) return;
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const OnBoardingScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Center(
        child: Column(
          children: [
            Spacer(),
            CustomLogoRiwaq(),
            Gap(10),
            Text('لكل كتاب قارئ جديد', style: TextStyle(color: Colors.white)),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
