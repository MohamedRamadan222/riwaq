import 'package:equatable/equatable.dart';
import 'package:riwaq/features/home/domain/entities/product_entity.dart';

abstract class FavoritesState extends Equatable {
  const FavoritesState();

  @override
  List<Object?> get props => [];
}

class FavoritesLoaded extends FavoritesState {
  final List<ProductEntity> products;

  const FavoritesLoaded(this.products);

  @override
  List<Object?> get props => [products];
}