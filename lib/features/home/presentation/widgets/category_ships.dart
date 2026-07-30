import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_styles.dart';

class CategorySelector extends StatefulWidget {
  final Function(String?)? onCategorySelected;

  const CategorySelector({super.key, this.onCategorySelected});

  @override
  State<CategorySelector> createState() => _CategorySelectorState();
}

class _CategorySelectorState extends State<CategorySelector> {
  int selectedIndex = 0;

  final List<Map<String, dynamic>> categories = const [
    {'title': 'الكل'},
    {'title': 'روايات'},
    {'title': 'تاريخ'},
    {'title': 'علوم'},
    {'title': 'تنمية ذاتية'},
    {'title': 'دين'},
    {'title': 'أدب'},
    {'title': 'شعر'},
    {'title': 'أطفال'},
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: categories.length,
          itemBuilder: (context, index) {
            final category = categories[index];
            final String itemName = category['title'];
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
                    border: Border.all(color: AppColors.fieldBorder, width: 1),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        itemName,
                        style: AppStyles.bold13.copyWith(
                          color: isSelected
                              ? AppColors.white
                              : AppColors.textUnselected,
                        ),
                      ),
                    ],
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
