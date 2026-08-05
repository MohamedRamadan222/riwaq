import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:riwaq/features/auth/data/datasources/auth_local_data_source.dart';
import 'package:riwaq/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:riwaq/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:riwaq/features/auth/domain/repositories/auth_repository.dart';
import 'package:riwaq/features/auth/domain/usecases/login_usecase.dart';
import 'package:riwaq/features/auth/presentation/cubit/login_cubit.dart';

final sl = GetIt.instance;

Future<void> initInjection() async {
  sl.registerLazySingleton<Dio>(() => Dio());

  final userBox = await Hive.openBox(userBoxName);
  sl.registerLazySingleton<Box>(() => userBox);

  sl.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl(sl()),
  );

  sl.registerLazySingleton<AuthLocalDataSource>(
    () => AuthLocalDataSourceImpl(sl()),
  );

  sl.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(remoteDataSource: sl(), localDataSource: sl()),
  );

  sl.registerLazySingleton<LoginUseCase>(
      () => LoginUseCase(sl())
  );

  sl.registerFactory<LoginCubit>(() => LoginCubit(sl()));
}
