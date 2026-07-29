import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:riwaq/core/constants/app_colors.dart';
import 'package:riwaq/core/constants/app_styles.dart';
import 'package:riwaq/core/utils/widgets/custom_elevated_button.dart';

import '../../../auth/presentation/widgets/custom_text_field.dart';
import '../widgets/cateory_ships.dart';
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
      backgroundColor: AppColors.white,
      appBar: AppBar(
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
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  height: 85,
                  decoration: BoxDecoration(
                    color: AppColors.primary.withValues(alpha: 0.6),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomElevatedButton(
                        onPressed: () {},
                        title: 'تفعيل',
                        width: 80,
                        radius: 8,
                        fontSize: 12,
                        height: 42,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text('كتب قريبة منك؟', style: AppStyles.bold13),
                          Gap(3),
                          Text(
                            'فعل الموقع لرؤية الوراقون\n القريبون منك',
                            textDirection: TextDirection.rtl,
                            style: AppStyles.bold13.copyWith(
                              fontSize: 10,
                              color: Colors.grey[700],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Gap(20),
                Container(
                  height: 180,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    color: AppColors.primary.withValues(alpha: 0.8),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Positioned(
                        top: -30,
                        left: -30,
                        child: Container(
                          width: 120,
                          height: 120,
                          decoration: BoxDecoration(
                            color: AppColors.primary,
                            borderRadius: BorderRadius.circular(64),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: -60,
                        right: -40,
                        child: Container(
                          width: 120,
                          height: 120,
                          decoration: BoxDecoration(
                            color: AppColors.primary,
                            borderRadius: BorderRadius.circular(64),
                          ),
                        ),
                      ),
                      Positioned(
                        right: 40,
                        top: 25,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              'لديك كتب لا تقرأها؟',
                              style: AppStyles.bold13.copyWith(
                                fontSize: 16,
                                color: Colors.white,
                              ),
                            ),
                            Gap(3),
                            Text(
                              'قد يكون كتاب على رفك نافذة\n معرفة لشخص اخر',
                              textDirection: TextDirection.rtl,
                              style: AppStyles.bold13.copyWith(
                                fontSize: 12,
                                color: Colors.white,
                              ),
                            ),
                            Gap(15),
                            CustomElevatedButton(
                              onPressed: () {},
                              title: 'أضف كتابك الان',
                              width: 130,
                              radius: 8,
                              fontSize: 12,
                              height: 45,
                              fontColor: AppColors.primary,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
