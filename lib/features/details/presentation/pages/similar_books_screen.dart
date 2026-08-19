import 'package:flutter/material.dart';
import 'package:riwaq/features/home/domain/entities/product_entity.dart';
import 'package:riwaq/features/home/presentation/widgets/custom_grid_view.dart';

class SimilarBooksScreen extends StatelessWidget {
  final String title;
  final List<ProductEntity> products;

  const SimilarBooksScreen({
    super.key,
    required this.title,
    required this.products,
  });

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
        title: Text(title),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
          child: CustomGridView(
            products: products,
            allProducts: products,
          ),
        ),
      ),
    );
  }
}