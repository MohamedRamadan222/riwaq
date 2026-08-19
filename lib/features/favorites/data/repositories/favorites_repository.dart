import 'package:riwaq/features/favorites/data/datasources/favorites_local_data_source.dart';
import 'package:riwaq/features/home/domain/entities/product_entity.dart';

class FavoritesRepository {
  final FavoritesLocalDataSource localDataSource;

  FavoritesRepository(this.localDataSource);

  Future<List<ProductEntity>> getFavorites() => localDataSource.getFavorites();

  Future<void> saveFavorites(List<ProductEntity> products) =>
      localDataSource.saveFavorites(products);
}