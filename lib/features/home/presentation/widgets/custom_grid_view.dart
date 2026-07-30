import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_styles.dart';

class CustomGridView extends StatefulWidget {
  const CustomGridView({super.key});

  @override
  State<CustomGridView> createState() => _CustomGridViewState();
}

class _CustomGridViewState extends State<CustomGridView> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 24,
        crossAxisSpacing: 18,
        childAspectRatio: 0.60,
      ),
      itemCount: 10,
      itemBuilder: (context, index) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withValues(alpha: 0.2),
                spreadRadius: 2,
                blurRadius: 5,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset(
                          'assets/images/book5.jpg',
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned(
                        top: 8,
                        right: 8,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 3,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.primary.withValues(
                              alpha: 0.8,
                            ),
                            borderRadius: BorderRadius.circular(32),
                          ),
                          child: Text(
                            'إعارة',
                            style: AppStyles.bold13.copyWith(
                              color: AppColors.white,
                              fontSize: 9,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const Gap(8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        'كتاب التوحيد',
                        overflow: TextOverflow.ellipsis,
                        style: AppStyles.bold13.copyWith(
                          fontSize: 11,
                        ),
                      ),
                    ),
                    const Icon(CupertinoIcons.heart, size: 16),
                  ],
                ),
                const Gap(4),
                Text(
                  'محمد رمضان',
                  style: AppStyles.bold13.copyWith(
                    fontSize: 8,
                    color: Colors.grey,
                  ),
                ),
                const Gap(4),
                Row(
                  children: [
                    const Icon(
                      CupertinoIcons.location_solid,
                      size: 14,
                    ),
                    const Gap(4),
                    Expanded(
                      child: Text(
                        'المنصورة',
                        overflow: TextOverflow.ellipsis,
                        style: AppStyles.bold13.copyWith(
                          fontSize: 10,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
