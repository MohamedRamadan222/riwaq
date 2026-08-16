import 'package:dartz/dartz.dart';
import 'package:riwaq/core/error/exceptions.dart';
import 'package:riwaq/core/error/failures.dart';
import 'package:riwaq/features/home/data/datasources/product_remote_data_source.dart';
import 'package:riwaq/features/home/domain/entities/product_entity.dart';
import 'package:riwaq/features/home/domain/repositories/product_repository.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductRemoteDataSource remoteDataSource;

  ProductRepositoryImpl({
    required this.remoteDataSource,
  });

  @override
  Future<Either<Failure, List<ProductEntity>>> getProducts({
    required int limit,
    required int skip,
  }) async {
    try {
      final products = await remoteDataSource.getProducts(
        limit: limit,
        skip: skip,
      );
      return Right(products);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.errMsg));
    } catch (_) {
      return Left(ServerFailure('حدث خطأ غير متوقع'));
    }
  }
}
