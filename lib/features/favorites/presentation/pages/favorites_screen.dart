import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:riwaq/core/constants/app_colors.dart';
import 'package:riwaq/core/constants/app_styles.dart';
import 'package:riwaq/features/favorites/presentation/cubit/favorites_cubit.dart';
import 'package:riwaq/features/favorites/presentation/cubit/favorites_state.dart';
import 'package:riwaq/features/home/domain/entities/product_entity.dart';
import 'package:riwaq/features/home/presentation/widgets/custom_grid_view.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

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
        title: const Text('المفضلة'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: BlocBuilder<FavoritesCubit, FavoritesState>(
          builder: (context, state) {
            final products = state is FavoritesLoaded
                ? state.products
                : const <ProductEntity>[];
            if (products.isEmpty) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      CupertinoIcons.heart,
                      size: 60,
                      color: AppColors.primary.withValues(alpha: 0.4),
                    ),
                    const Gap(16),
                    Text(
                      'لا توجد كتب مفضلة بعد',
                      style: AppStyles.bold13,
                    ),
                    const Gap(6),
                    Text(
                      'اضغط على القلب في اي كتاب ليظهر هنا',
                      style: AppStyles.bold13.copyWith(
                        fontSize: 11,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              );
            }
            return SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
              child: CustomGridView(
                products: products,
                allProducts: products,
              ),
            );
          },
        ),
      ),
    );
  }
}