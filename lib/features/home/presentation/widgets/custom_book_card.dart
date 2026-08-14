import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_styles.dart';
import '../../../details/presentation/pages/book_details_screen.dart';
import '../../domain/entities/product_entity.dart';

class CustomBookCard extends StatefulWidget {
  final ProductEntity product;

  const CustomBookCard({super.key, this.product = const ProductEntity(
    id: 0,
    title: 'كتاب التوحيد',
    description: '',
    category: '',
    price: 0,
    discountPercentage: 0,
    rating: 0,
    stock: 0,
    brand: 'محمد رمضان',
    thumbnail: '',
    images: [],
  )});

  @override
  State<CustomBookCard> createState() => _CustomBookCardState();
}

class _CustomBookCardState extends State<CustomBookCard> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const BookDetailsScreen()),
        );
      },
      child: Container(
        width: 140,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            width: 1,
            color: AppColors.primary.withValues(alpha: 0.4),
          ),
          // boxShadow: [
          //   BoxShadow(
          //     color: Colors.grey.withValues(alpha: 0.1),
          //     spreadRadius: 2,
          //     blurRadius: 5,
          //     offset: const Offset(0, 0),
          //   ),
          // ],
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
                      child: Image.network(
                        widget.product.thumbnail,
                        width: double.infinity,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) =>
                            Image.asset(
                          'assets/images/book5.jpg',
                          fit: BoxFit.cover,
                        ),
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
                          color: AppColors.primary.withValues(alpha: 0.8),
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
                      widget.product.title,
                      overflow: TextOverflow.ellipsis,
                      style: AppStyles.bold13.copyWith(fontSize: 11),
                    ),
                  ),
                  const Icon(CupertinoIcons.heart, size: 16),
                ],
              ),
              const Gap(4),
              Text(
                widget.product.brand,
                style: AppStyles.bold13.copyWith(
                  fontSize: 8,
                  color: Colors.grey,
                ),
              ),
              const Gap(4),
              Row(
                children: [
                  const Icon(CupertinoIcons.location_solid, size: 14),
                  const Gap(4),
                  Expanded(
                    child: Text(
                      'المنصورة',
                      overflow: TextOverflow.ellipsis,
                      style: AppStyles.bold13.copyWith(fontSize: 10),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
