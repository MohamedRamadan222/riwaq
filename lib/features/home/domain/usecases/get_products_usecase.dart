import 'package:dartz/dartz.dart';
import 'package:riwaq/core/error/failures.dart';
import 'package:riwaq/features/home/domain/entities/product_entity.dart';

import '../repositories/product_repository.dart';

class GetProductsUsecase {
  final ProductRepository repository;

  GetProductsUsecase(this.repository);

  Future<Either<Failure, List<ProductEntity>>> call({
    required int limit,
    required int skip,
  }) =>
      repository.getProducts(limit: limit, skip: skip);
}
