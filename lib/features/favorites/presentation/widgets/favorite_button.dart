import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:riwaq/core/constants/app_colors.dart';
import 'package:riwaq/features/favorites/presentation/cubit/favorites_cubit.dart';
import 'package:riwaq/features/favorites/presentation/cubit/favorites_state.dart';
import 'package:riwaq/features/home/domain/entities/product_entity.dart';

class FavoriteButton extends StatelessWidget {
  final ProductEntity product;
  final double iconSize;
  final Color activeColor;
  final Color inactiveColor;

  const FavoriteButton({
    super.key,
    required this.product,
    this.iconSize = 16,
    this.activeColor = AppColors.primary,
    this.inactiveColor = Colors.grey,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoritesCubit, FavoritesState>(
      builder: (context, state) {
        final isFavorite = state is FavoritesLoaded &&
            state.products.any((p) => p.id == product.id);
        return GestureDetector(
          onTap: () =>
              context.read<FavoritesCubit>().toggleFavorite(product),
          child: Icon(
            isFavorite ? CupertinoIcons.heart_fill : CupertinoIcons.heart,
            size: iconSize,
            color: isFavorite ? activeColor : inactiveColor,
          ),
        );
      },
    );
  }
}