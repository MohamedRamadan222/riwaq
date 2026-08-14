import 'package:dartz/dartz.dart';
import 'package:riwaq/core/error/failures.dart';
import 'package:riwaq/features/home/domain/entities/product_entity.dart';

abstract class ProductRepository {
  Future<Either<Failure, List<ProductEntity>>> getProducts();
}
