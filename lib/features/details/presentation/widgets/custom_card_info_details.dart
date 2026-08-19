import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_styles.dart';
import '../../../home/domain/entities/product_entity.dart';

class CustomCardInfoDetails extends StatelessWidget {
  final ProductEntity product;

  const CustomCardInfoDetails({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          width: 1,
          color: AppColors.primary.withValues(alpha: 0.4),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(product.brand, style: AppStyles.bold13),
                const Gap(8),
                Text(
                  product.description,
                  textAlign: TextAlign.end,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: AppStyles.bold13.copyWith(
                    color: Colors.grey,
                    fontSize: 10,
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),
          const Gap(12),
          ClipRRect(
            borderRadius: BorderRadius.circular(64),
            child: Image.network(
              product.thumbnail.isEmpty
                  ? 'assets/images/book5.jpg'
                  : product.thumbnail,
              width: 60,
              height: 60,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => Image.asset(
                'assets/images/book5.jpg',
                width: 60,
                height: 60,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}