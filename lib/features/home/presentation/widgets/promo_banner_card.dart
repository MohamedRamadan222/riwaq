import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_styles.dart';

class PromoBannerCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String buttonText;
  final VoidCallback onPressed;
  final Color backgroundColor;
  final bool filledButton;

  const PromoBannerCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.buttonText,
    required this.onPressed,
    this.backgroundColor = AppColors.primary,
    this.filledButton = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            title,
            textAlign: TextAlign.right,
            style: AppStyles.bold13.copyWith(
              color: AppColors.white,
              fontSize: 16,
            ),
          ),
          const Gap(6),
          Text(
            subtitle,
            textAlign: TextAlign.right,
            style: AppStyles.bold13.copyWith(
              color: AppColors.white.withValues(alpha: 0.85),
              fontSize: 12,
              fontWeight: FontWeight.normal,
            ),
          ),
          const Gap(16),
          Align(
            alignment: Alignment.centerRight,
            child: SizedBox(
              width: 140,
              height: 42,
              child: ElevatedButton(
                onPressed: onPressed,
                style: ElevatedButton.styleFrom(
                  backgroundColor: filledButton ? AppColors.white : Colors.transparent,
                  foregroundColor: filledButton ? backgroundColor : AppColors.white,
                  elevation: 0,
                  side: filledButton
                      ? null
                      : const BorderSide(color: AppColors.white, width: 1.2),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  buttonText,
                  style: AppStyles.bold13.copyWith(fontSize: 13),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}