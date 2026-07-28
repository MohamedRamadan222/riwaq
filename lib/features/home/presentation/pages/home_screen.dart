import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../core/constants/app_colors.dart';
import '../widgets/book_card.dart';
import '../widgets/category_chips.dart';
import '../widgets/home_search_field.dart';
import '../widgets/home_top_appbar.dart';
import '../widgets/promo_banner_card.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _selectedCategory = 'الكل';

  final List<String> _categories = ['الكل', 'روايات', 'تطوير ذات', 'تاريخ', 'علوم'];


  final List<BookModel> _books = [
    BookModel(
      title: 'الداء والدواء',
      author: 'لابن القيم',
      imagePath: 'assets/images/book1.jpg',
      location: 'القاهرة',
      rating: 4.8,
      badgeType: BookBadgeType.exchange,
    ),
    BookModel(
      title: 'كن بخير',
      author: 'عائشة العمران',
      imagePath: 'assets/images/book2.jpg',
      location: 'الدقهلية',
      rating: 4.5,
      badgeType: BookBadgeType.rent,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          children: [
            const HomeTopBar(),
            const Gap(20),
            const HomeSearchField(),
            const Gap(20),

            // بانر: كتب قريبة منك
            PromoBannerCard(
              title: 'كتب قريبة منك؟',
              subtitle: 'فعّل الموقع لرؤية الكتب القريبين منك',
              buttonText: 'تفعيل',
              filledButton: true,
              backgroundColor: AppColors.primary.withValues(alpha: 0.12),
              onPressed: () {
                // todo: طلب صلاحية الموقع
              },
            ),
            const Gap(16),

            // بانر: أضف كتابك
            PromoBannerCard(
              title: 'لديك كتب لا تقرأها؟',
              subtitle: 'قد يكون كتابك على رفك نافذة معرفة لشخص آخر',
              buttonText: 'أضف كتابك الآن',
              filledButton: true,
              backgroundColor: AppColors.primary,
              onPressed: () {
                // todo: انتقل لشاشة إضافة كتاب
              },
            ),
            const Gap(24),

            // الأقسام
            CategoryChipsRow(
              categories: _categories,
              selected: _selectedCategory,
              onSelected: (value) => setState(() => _selectedCategory = value),
              onViewAll: () {
                // todo: انتقل لشاشة كل الأقسام
              },
            ),
            const Gap(20),

            // شبكة الكتب
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: _books.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 14,
                crossAxisSpacing: 14,
                childAspectRatio: 0.55,
              ),
              itemBuilder: (context, index) {
                final book = _books[index];
                return BookCard(
                  book: book,
                  onTap: () {
                    // todo: انتقل لتفاصيل الكتاب
                  },
                  onFavoriteTap: () {
                    // todo: toggle favorite
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}