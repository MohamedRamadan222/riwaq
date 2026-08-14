import 'package:dio/dio.dart';
import 'package:riwaq/core/error/exceptions.dart';
import 'package:riwaq/features/home/data/models/product_model.dart';

abstract class ProductRemoteDataSource {
  Future<List<ProductModel>> getProducts();
}

class ProductRemoteDataSourceImpl implements ProductRemoteDataSource {
  final Dio dio;

  ProductRemoteDataSourceImpl(this.dio);

  @override
  Future<List<ProductModel>> getProducts() async {
    try {
      final response = await dio.get('https://dummyjson.com/products');
      final List products = response.data['products'];
      return products
          .map((product) => ProductModel.fromJson(product))
          .toList();
    } on DioException catch (e) {
      final errMsg = e.response?.data['message'] ?? "حدث خطأ فى السيرفير";
      throw ServerException(errMsg);
    }
  }
}
