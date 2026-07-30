import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:riwaq/core/constants/app_colors.dart';
import 'package:riwaq/core/constants/app_styles.dart';
import '../widgets/category_ships.dart';
import '../widgets/custom_card_home.dart';
import '../widgets/custom_grid_view.dart';
import '../widgets/custom_promo_card.dart';
import '../widgets/custom_text_field_home.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.grey[100],
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        scrolledUnderElevation: 0,
        toolbarHeight: 50,
        leading: Icon(CupertinoIcons.bell),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  'الموقع الحالى',
                  style: TextStyle(color: Colors.grey, fontSize: 9),
                ),
                Gap(5),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(Icons.arrow_back_ios_rounded, size: 19),
                    Gap(5),
                    Text(
                      'تحديد الموقع',
                      style: AppStyles.bold13.copyWith(fontSize: 11),
                    ),
                    Gap(5),
                    Icon(Icons.location_on_outlined, size: 19),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: [
                Gap(20),
                CustomTextFieldHome(
                  controller: _searchController,
                  hintText: 'ابحث عن كتاب او مؤلف',
                ),
                Gap(20),
                CustomPromoCard(),
                Gap(20),
                CustomCardHome(),
                Gap(20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'عرض الكل',
                      style: AppStyles.bold13.copyWith(
                        color: AppColors.primary,
                      ),
                    ),
                    Text('تصفح بالاقسام', style: AppStyles.bold13),
                  ],
                ),
                Gap(20),
                CategorySelector(),
                Gap(20),
                CustomGridView(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
