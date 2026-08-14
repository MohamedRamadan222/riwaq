import 'package:flutter/material.dart';

import '../../domain/entities/product_entity.dart';
import '../widgets/custom_book_card.dart';

class CustomGridView extends StatefulWidget {
  final List<ProductEntity> products;

  const CustomGridView({super.key, required this.products});

  @override
  State<CustomGridView> createState() => _CustomGridViewState();
}

class _CustomGridViewState extends State<CustomGridView> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 24,
        crossAxisSpacing: 18,
        childAspectRatio: 0.60,
      ),
      itemCount: widget.products.length,
      itemBuilder: (context, index) {
        return CustomBookCard(product: widget.products[index]);
      },
    );
  }
}