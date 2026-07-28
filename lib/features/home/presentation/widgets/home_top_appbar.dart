import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_styles.dart';

class HomeTopBar extends StatelessWidget {
  final VoidCallback? onNotificationTap;
  final VoidCallback? onLocationTap;

  const HomeTopBar({
    super.key,
    this.onNotificationTap,
    this.onLocationTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
          onTap: onNotificationTap,
          borderRadius: BorderRadius.circular(24),
          child: const Padding(
            padding: EdgeInsets.all(4),
            child: Icon(Icons.notifications_none, size: 26),
          ),
        ),
        InkWell(
          onTap: onLocationTap,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text('الموقع الحالي', style: AppStyles.bold13.copyWith(fontSize: 12)),
              const Gap(2),
              Row(
                children: [
                  Text(
                    'تحديد الموقع',
                    style: AppStyles.bold13.copyWith(
                      color: AppColors.primary,
                      fontSize: 13,
                    ),
                  ),
                  const Gap(4),
                  const Icon(Icons.location_on_outlined, color: AppColors.primary, size: 16),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}