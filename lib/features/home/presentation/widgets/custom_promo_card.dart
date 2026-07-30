import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_styles.dart';
import '../../../../core/utils/widgets/custom_elevated_button.dart';

class CustomPromoCard extends StatelessWidget {
  const CustomPromoCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      height: 85,
      decoration: BoxDecoration(
        color: AppColors.primary.withValues(alpha: 0.6),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomElevatedButton(
            onPressed: () {},
            title: 'تفعيل',
            width: 80,
            radius: 8,
            fontSize: 12,
            height: 42,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text('كتب قريبة منك؟', style: AppStyles.bold13),
              Gap(3),
              Text(
                'فعل الموقع لرؤية الوراقون\n القريبون منك',
                textDirection: TextDirection.rtl,
                style: AppStyles.bold13.copyWith(
                  fontSize: 10,
                  color: Colors.grey[700],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
