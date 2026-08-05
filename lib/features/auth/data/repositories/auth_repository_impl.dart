import 'package:dartz/dartz.dart';
import 'package:riwaq/core/error/exceptions.dart';
import 'package:riwaq/core/error/failures.dart';
import 'package:riwaq/features/auth/data/datasources/auth_local_data_source.dart';
import 'package:riwaq/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:riwaq/features/auth/domain/entities/user_entity.dart';
import 'package:riwaq/features/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;
  final AuthLocalDataSource localDataSource;

  AuthRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
  });

  @override
  Future<Either<Failure, UserEntity>> login({
    required String username,
    required String password,
  }) async {
    try {
      final userModel = await remoteDataSource.login(
        username: username,
        password: password,
      );
      await localDataSource.cacheUser(userModel);
      return Right(userModel);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.errMsg));
    } catch (_) {
      return Left(ServerFailure('حدث خطأ غير متوقع'));
    }
  }
}
