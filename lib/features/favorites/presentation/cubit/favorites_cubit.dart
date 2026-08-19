import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:riwaq/features/favorites/data/repositories/favorites_repository.dart';
import 'package:riwaq/features/favorites/presentation/cubit/favorites_state.dart';
import 'package:riwaq/features/home/domain/entities/product_entity.dart';

class FavoritesCubit extends Cubit<FavoritesState> {
  final FavoritesRepository repository;

  FavoritesCubit(this.repository) : super(const FavoritesLoaded([]));

  Future<void> loadFavorites() async {
    final products = await repository.getFavorites();
    emit(FavoritesLoaded(products));
  }

  bool isFavorite(int productId) {
    final state = this.state;
    if (state is! FavoritesLoaded) return false;
    return state.products.any((p) => p.id == productId);
  }

  Future<void> toggleFavorite(ProductEntity product) async {
    final state = this.state;
    if (state is! FavoritesLoaded) return;
    final exists = state.products.any((p) => p.id == product.id);
    final updated = exists
        ? state.products.where((p) => p.id != product.id).toList()
        : [...state.products, product];
    emit(FavoritesLoaded(updated));
    await repository.saveFavorites(updated);
  }

  Future<void> removeFavorite(int productId) async {
    final state = this.state;
    if (state is! FavoritesLoaded) return;
    final updated =
        state.products.where((p) => p.id != productId).toList();
    emit(FavoritesLoaded(updated));
    await repository.saveFavorites(updated);
  }
}