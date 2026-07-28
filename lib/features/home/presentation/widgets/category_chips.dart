import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_styles.dart';

class CategoryChipsRow extends StatelessWidget {
  final List<String> categories;
  final String selected;
  final ValueChanged<String> onSelected;
  final VoidCallback onViewAll;

  const CategoryChipsRow({
    super.key,
    required this.categories,
    required this.selected,
    required this.onSelected,
    required this.onViewAll,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
              onPressed: onViewAll,
              child: Text(
                'عرض الكل',
                style: AppStyles.bold13.copyWith(color: AppColors.primary, fontSize: 12),
              ),
            ),
            Text('تصفح بالأقسام', style: AppStyles.bold13.copyWith(fontSize: 15)),
          ],
        ),
        const Gap(8),
        SizedBox(
          height: 40,
          child: ListView.separated(
            reverse: true,
            scrollDirection: Axis.horizontal,
            itemCount: categories.length,
            separatorBuilder: (_, __) => const Gap(10),
            itemBuilder: (context, index) {
              final category = categories[index];
              final isSelected = category == selected;
              return _CategoryChip(
                label: category,
                isSelected: isSelected,
                onTap: () => onSelected(category),
              );
            },
          ),
        ),
      ],
    );
  }
}

class _CategoryChip extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const _CategoryChip({
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primary : AppColors.star,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          label,
          style: AppStyles.bold13.copyWith(
            color: isSelected ? AppColors.white : AppColors.textHint,
            fontSize: 13,
          ),
        ),
      ),
    );
  }
}