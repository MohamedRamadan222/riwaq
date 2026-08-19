import 'package:riwaq/features/home/domain/entities/product_entity.dart';

class ProductModel extends ProductEntity {
  const ProductModel({
    required super.id,
    required super.title,
    required super.description,
    required super.category,
    required super.discountPercentage,
    required super.brand,
    required super.price,
    required super.rating,
    required super.images,
    required super.stock,
    required super.thumbnail,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'] ?? 0,
      title: json['title'] ?? 'غير معروف',
      description: json['description'] ?? 'لا يوجد وصف',
      category: json['category'] ?? 'غير مصنف',
      price: (json['price'] as num?)?.toDouble() ?? 0.0,
      discountPercentage:
          (json['discountPercentage'] as num?)?.toDouble() ?? 0.0,
      rating: (json['rating'] as num?)?.toDouble() ?? 0.0,
      stock: json['stock'] ?? 0,
      brand: json['brand'] ?? 'غير معروف',
      thumbnail: json['thumbnail'] ?? '',
      images: List<String>.from(json['images'] ?? []),
    );
  }

  factory ProductModel.fromEntity(ProductEntity entity) {
    return ProductModel(
      id: entity.id,
      title: entity.title,
      description: entity.description,
      category: entity.category,
      discountPercentage: entity.discountPercentage,
      brand: entity.brand,
      price: entity.price,
      rating: entity.rating,
      images: entity.images,
      stock: entity.stock,
      thumbnail: entity.thumbnail,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'category': category,
      'discountPercentage': discountPercentage,
      'brand': brand,
      'price': price,
      'rating': rating,
      'images': images,
      'stock': stock,
      'thumbnail': thumbnail,
    };
  }
}
