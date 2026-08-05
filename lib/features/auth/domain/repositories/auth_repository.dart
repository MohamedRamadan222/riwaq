import 'package:dartz/dartz.dart';
import 'package:riwaq/core/error/failures.dart';
import 'package:riwaq/features/auth/domain/entities/user_entity.dart';

abstract class AuthRepository {
  Future<Either<Failure, UserEntity>> login({
    required String username,
    required String password,
  });
}
