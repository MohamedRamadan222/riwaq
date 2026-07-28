import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_styles.dart';

enum BookBadgeType { exchange, rent }

class BookModel {
  final String title;
  final String author;
  final String imagePath;
  final String location;
  final double rating;
  final BookBadgeType badgeType;
  final bool isFavorite;

  BookModel({
    required this.title,
    required this.author,
    required this.imagePath,
    required this.location,
    required this.rating,
    required this.badgeType,
    this.isFavorite = false,
  });
}

class BookCard extends StatelessWidget {
  final BookModel book;
  final VoidCallback? onTap;
  final VoidCallback? onFavoriteTap;

  const BookCard({
    super.key,
    required this.book,
    this.onTap,
    this.onFavoriteTap,
  });

  String get _badgeLabel =>
      book.badgeType == BookBadgeType.exchange ? 'تبادل' : 'إعارة';

  Color get _badgeColor =>
      book.badgeType == BookBadgeType.exchange ? AppColors.star : AppColors.primary;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          // صورة الكتاب مع البادج
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(14),
                child: AspectRatio(
                  aspectRatio: 0.78,
                  child: Image.asset(
                    book.imagePath,
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                ),
              ),
              Positioned(
                top: 8,
                right: 8,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: _badgeColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    _badgeLabel,
                    style: AppStyles.bold13.copyWith(color: AppColors.white, fontSize: 11),
                  ),
                ),
              ),
            ],
          ),
          const Gap(8),

          // العنوان + زرار المفضلة
          Row(
            children: [
              InkWell(
                onTap: onFavoriteTap,
                child: Icon(
                  book.isFavorite ? Icons.favorite : Icons.favorite_border,
                  size: 20,
                  color: book.isFavorite ? AppColors.primary : AppColors.textHint,
                ),
              ),
              const Spacer(),
              Text(
                book.title,
                style: AppStyles.bold13.copyWith(fontSize: 14),
              ),
            ],
          ),
          const Gap(4),

          // اسم المؤلف
          Text(
            book.author,
            textAlign: TextAlign.right,
            style: AppStyles.bold13.copyWith(
              color: AppColors.textHint,
              fontSize: 11,
              fontWeight: FontWeight.normal,
            ),
          ),
          const Gap(4),

          // التقييم + الموقع
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                book.location,
                style: AppStyles.bold13.copyWith(
                  color: AppColors.textHint,
                  fontSize: 11,
                  fontWeight: FontWeight.normal,
                ),
              ),
              const Gap(2),
              const Icon(Icons.location_on_outlined, size: 12, color: AppColors.textHint),
              const Gap(8),
              Text(
                book.rating.toString(),
                style: AppStyles.bold13.copyWith(fontSize: 11),
              ),
              const Gap(2),
              const Icon(Icons.star, size: 12, color: Colors.amber),
            ],
          ),
        ],
      ),
    );
  }
}