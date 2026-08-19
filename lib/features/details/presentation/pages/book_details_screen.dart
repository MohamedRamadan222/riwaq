import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:riwaq/core/utils/widgets/custom_elevated_button.dart';
import 'package:riwaq/features/home/domain/entities/product_entity.dart';
import 'package:riwaq/features/home/presentation/widgets/custom_book_card.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_styles.dart';
import '../widgets/custom_card_info_details.dart';
import '../widgets/custom_details_book_card.dart';
import 'similar_books_screen.dart';

class BookDetailsScreen extends StatefulWidget {
  final ProductEntity product;
  final List<ProductEntity> similarProducts;

  const BookDetailsScreen({
    super.key,
    required this.product,
    this.similarProducts = const [],
  });

  @override
  State<BookDetailsScreen> createState() => _BookDetailsScreenState();
}

class _BookDetailsScreenState extends State<BookDetailsScreen> {
  List<ProductEntity> get _similarBooks {
    final similar = widget.similarProducts
        .where(
          (p) =>
              p.id != widget.product.id &&
              p.category == widget.product.category,
        )
        .toList();
    if (similar.isEmpty) {
      return widget.similarProducts
          .where((p) => p.id != widget.product.id)
          .take(10)
          .toList();
    }
    return similar.take(10).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[100],
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        scrolledUnderElevation: 0,
        toolbarHeight: 50,
        title: Text(widget.product.title),
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
                CustomDetailsBookCard(product: widget.product),
                Gap(20),
                Text('عن الكتاب', style: AppStyles.bold13),
                Gap(16),
                Text(
                  widget.product.description,
                  textDirection: TextDirection.rtl,
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontSize: 13.0,
                    height: 1.6,
                  ),
                ),
                Gap(24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        if (_similarBooks.isEmpty) return;
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => SimilarBooksScreen(
                              title: 'كتب متشابهة',
                              products: _similarBooks,
                            ),
                          ),
                        );
                      },
                      child: Text(
                        'عرض الكل',
                        style: AppStyles.bold13.copyWith(
                          color: AppColors.primary,
                        ),
                      ),
                    ),
                    Text('كتب متشابهة', style: AppStyles.bold13),
                  ],
                ),
                Gap(20),
                SizedBox(
                  height: 220,
                  child: _similarBooks.isEmpty
                      ? const SizedBox.shrink()
                      : ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: _similarBooks.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(left: 12),

                              child: SizedBox(
                                width: 140,
                                child: CustomBookCard(
                                  product: _similarBooks[index],
                                  similarProducts: widget.similarProducts,
                                ),
                              ),
                            );
                          },
                        ),
                ),
                Gap(24),
                Text(widget.product.brand, style: AppStyles.bold13),
                Gap(16),
                CustomCardInfoDetails(product: widget.product),
                Gap(40),
                CustomElevatedButton(
                  title: ' التواصل للإعارة',
                  fontSize: 14,
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          'لم يتم تفعيل التواصل بعد، حاول الدخول لاحقا',
                          textDirection: TextDirection.rtl,
                        ),
                      ),
                    );
                  },
                  radius: 8,
                ),
                Gap(24),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
