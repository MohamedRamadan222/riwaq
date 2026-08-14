import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:riwaq/core/utils/widgets/custom_elevated_button.dart';
import 'package:riwaq/features/home/presentation/widgets/custom_book_card.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_styles.dart';
import '../widgets/custom_card_info_details.dart';
import '../widgets/custom_details_book_card.dart';

class BookDetailsScreen extends StatelessWidget {
  const BookDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[100],
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        scrolledUnderElevation: 0,
        toolbarHeight: 50,
        title: const Text('تفاصيل الكتاب'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Gap(20),
                CustomDetailsBookCard(),
                Gap(15),
                Text('عن الكتاب', style: AppStyles.bold13),
                Gap(20),
                Text(
                  '''"تم الاعتماد في هذا المشروع بشكل أساسي على كتاب 'إدارة المشاريع باحترافية' باعتباره مرجعاً علمياً وعملياً موثوقاً. يساهم الكتاب في تأطير فكرة المشروع وتوضيح أهدافه وطرق تنفيذها عبر منهجيات واضحة ومدروسة. كما تم استنباط الجداول الزمنية ومعايير تقييم الأداء والموارد المطلوبة استناداً إلى الأدوات والنماذج التنظيمية التي يقدمها الكاتب، مما ضمن سير العمل وفق خطة دقيقة ومبنية على أسس معرفية سليمة."''',
                  textDirection: TextDirection.rtl,
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontSize: 13.0,
                    height: 1.5, //
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
                    Text('كتب متشابهة', style: AppStyles.bold13),
                  ],
                ),
                Gap(20),
                SizedBox(
                  height: 220,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return const Padding(
                        padding: EdgeInsets.only(left: 12),

                        child: CustomBookCard(),
                      );
                    },
                  ),
                ),
                Gap(20),
                Text('الوراق', style: AppStyles.bold13),
                Gap(20),
                CustomCardInfoDetails(),
                Gap(60),
                CustomElevatedButton(
                  title: ' التواصل للإعارة',
                  fontSize: 14,
                  onPressed: () {},
                  radius: 8,
                ),
                Gap(30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
