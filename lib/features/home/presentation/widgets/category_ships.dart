import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_styles.dart';

class CategorySelector extends StatefulWidget {
  final Function(String?)? onCategorySelected;
  final List<String>? categories;

  const CategorySelector({super.key, this.onCategorySelected, this.categories});

  @override
  State<CategorySelector> createState() => _CategorySelectorState();
}

class _CategorySelectorState extends State<CategorySelector> {
  int selectedIndex = 0;

  List<String> get categories => widget.categories ??
      const [
        'الكل',
        'روايات',
        'تاريخ',
        'علوم',
        'تنمية ذاتية',
        'دين',
        'أدب',
        'شعر',
        'أطفال',
      ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 44,
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 0),
          itemCount: categories.length,
          itemBuilder: (context, index) {
            final String itemName = categories[index];
            final bool isSelected = selectedIndex == index;
            return Padding(
              padding: const EdgeInsetsDirectional.only(end: 8),
              child: InkWell(
                borderRadius: BorderRadius.circular(32),
                onTap: () {
                  setState(() {
                    selectedIndex = index;
                  });
                  if (widget.onCategorySelected != null) {
                    widget.onCategorySelected!(index == 0 ? null : itemName);
                  }
                },
                child: Container(
                  height: 33,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: isSelected ? AppColors.primary : AppColors.white,
                    borderRadius: BorderRadius.circular(32),
                    border: Border.all(
                      color: AppColors.fieldBorder,
                      width: 1,
                    ),
                  ),
                  child: Text(
                    itemName,
                    style: AppStyles.bold13.copyWith(
                      color: isSelected
                          ? AppColors.white
                          : AppColors.textUnselected,
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
