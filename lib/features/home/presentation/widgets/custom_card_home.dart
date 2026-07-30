import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_styles.dart';
import '../../../../core/utils/widgets/custom_elevated_button.dart';

class CustomCardHome extends StatelessWidget {
  const CustomCardHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: AppColors.primary.withValues(alpha: 0.8),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            top: -30,
            left: -30,
            child: Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(64),
              ),
            ),
          ),
          Positioned(
            bottom: -60,
            right: -40,
            child: Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(64),
              ),
            ),
          ),
          Positioned(
            right: 40,
            top: 25,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  'لديك كتب لا تقرأها؟',
                  style: AppStyles.bold13.copyWith(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
                Gap(3),
                Text(
                  'قد يكون كتاب على رفك نافذة\n معرفة لشخص اخر',
                  textDirection: TextDirection.rtl,
                  style: AppStyles.bold13.copyWith(
                    fontSize: 12,
                    color: Colors.white,
                  ),
                ),
                Gap(15),
                CustomElevatedButton(
                  onPressed: () {},
                  title: 'أضف كتابك الان',
                  width: 130,
                  radius: 8,
                  fontSize: 12,
                  height: 45,
                  fontColor: AppColors.primary,
                  color: Colors.white,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
