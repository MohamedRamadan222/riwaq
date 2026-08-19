import 'dart:convert';

import 'package:hive_flutter/adapters.dart';
import 'package:riwaq/features/home/data/models/product_model.dart';
import 'package:riwaq/features/home/domain/entities/product_entity.dart';

abstract class FavoritesLocalDataSource {
  Future<List<ProductEntity>> getFavorites();

  Future<void> saveFavorites(List<ProductEntity> products);
}

const String favoritesBoxName = 'favoritesBox';
const String favoritesKey = 'FAVORITES';

class FavoritesLocalDataSourceImpl implements FavoritesLocalDataSource {
  final Box box;

  FavoritesLocalDataSourceImpl(this.box);

  @override
  Future<List<ProductEntity>> getFavorites() async {
    final raw = box.get(favoritesKey);
    if (raw == null) return [];
    final decoded = jsonDecode(raw) as List;
    return decoded
        .map(
          (e) => ProductModel.fromJson(Map<String, dynamic>.from(e as Map)),
        )
        .toList();
  }

  @override
  Future<void> saveFavorites(List<ProductEntity> products) async {
    final list = products
        .map((p) => ProductModel.fromEntity(p).toJson())
        .toList();
    await box.put(favoritesKey, jsonEncode(list));
  }
}
