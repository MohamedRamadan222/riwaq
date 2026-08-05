import 'package:dio/dio.dart';
import 'package:riwaq/core/error/exceptions.dart';
import 'package:riwaq/features/auth/data/models/user_model.dart';

abstract class AuthRemoteDataSource {
  Future<UserModel> login({required String username, required String password});
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final Dio dio;

  AuthRemoteDataSourceImpl(this.dio);

  @override
  Future<UserModel> login({
    required String username,
    required String password,
  }) async {
    try {
      final response = await dio.post(
        'https://dummyjson.com/auth/login',
        data: {'username': username, 'password': password},
      );
      return UserModel.formJson(response.data);
    } on DioException catch (e) {
      final errMsg = e.response?.data['message'] ?? "حدث خطأ فى السيرفير";
      throw ServerException(errMsg);
    }
  }
}
