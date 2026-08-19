import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_styles.dart';
import '../../../favorites/presentation/widgets/favorite_button.dart';
import '../../../home/domain/entities/product_entity.dart';

class CustomDetailsBookCard extends StatelessWidget {
  final ProductEntity product;

  const CustomDetailsBookCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: .2),
            blurRadius: 8,
            spreadRadius: 2,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.network(
                      product.thumbnail.isEmpty
                          ? 'assets/images/book5.jpg'
                          : product.thumbnail,
                      width: 170,
                      height: 260,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) => Image.asset(
                        'assets/images/book5.jpg',
                        width: 170,
                        height: 260,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 8,
                  right: 1,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.primary.withValues(alpha: .85),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      'متاح للإعارة',
                      style: AppStyles.bold13.copyWith(
                        color: Colors.white,
                        fontSize: 10,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 6,
                  bottom: 0,
                  child: Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(60),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withValues(alpha: 0.2),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Center(
                      child: FavoriteButton(
                        product: product,
                        iconSize: 18,
                        activeColor: AppColors.primary,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const Gap(8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '${product.price} ج.م',
                    style: AppStyles.bold13.copyWith(
                      color: AppColors.primary,
                      fontSize: 13,
                    ),
                  ),
                  Row(
                    children: [
                      const Icon(
                        CupertinoIcons.star_fill,
                        size: 14,
                        color: AppColors.primary,
                      ),
                      const Gap(4),
                      Text(
                        product.rating.toStringAsFixed(1),
                        style: AppStyles.bold13.copyWith(
                          color: Colors.grey,
                          fontSize: 12,
                        ),
                      ),
                    ],
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
