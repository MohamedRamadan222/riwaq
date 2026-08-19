import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:riwaq/features/auth/data/datasources/auth_local_data_source.dart';
import 'package:riwaq/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:riwaq/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:riwaq/features/auth/domain/repositories/auth_repository.dart';
import 'package:riwaq/features/auth/domain/usecases/login_usecase.dart';
import 'package:riwaq/features/auth/presentation/cubit/login_cubit.dart';
import 'package:riwaq/features/favorites/data/datasources/favorites_local_data_source.dart';
import 'package:riwaq/features/favorites/data/repositories/favorites_repository.dart';
import 'package:riwaq/features/favorites/presentation/cubit/favorites_cubit.dart';
import 'package:riwaq/features/home/data/datasources/product_remote_data_source.dart';
import 'package:riwaq/features/home/data/repositories/product_repository_impl.dart';
import 'package:riwaq/features/home/domain/repositories/product_repository.dart';
import 'package:riwaq/features/home/domain/usecases/get_products_usecase.dart';
import 'package:riwaq/features/home/presentation/cubit/home_cubit.dart';

final sl = GetIt.instance;

Future<void> initInjection() async {
  sl.registerLazySingleton<Dio>(() => Dio());

  final userBox = await Hive.openBox(userBoxName);
  sl.registerLazySingleton<Box>(() => userBox);

  final favoritesBox = await Hive.openBox(favoritesBoxName);
  sl.registerLazySingleton<Box>(() => favoritesBox, instanceName: favoritesBoxName);

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

  sl.registerLazySingleton<FavoritesLocalDataSource>(
    () => FavoritesLocalDataSourceImpl(sl<Box>(instanceName: favoritesBoxName)),
  );

  sl.registerLazySingleton<FavoritesRepository>(
    () => FavoritesRepository(sl()),
  );

  sl.registerLazySingleton<FavoritesCubit>(() => FavoritesCubit(sl()));

  sl.registerLazySingleton<ProductRemoteDataSource>(
    () => ProductRemoteDataSourceImpl(sl()),
  );

  sl.registerLazySingleton<ProductRepository>(
    () => ProductRepositoryImpl(remoteDataSource: sl()),
  );

  sl.registerLazySingleton<GetProductsUsecase>(
    () => GetProductsUsecase(sl()),
  );

  sl.registerFactory<HomeCubit>(() => HomeCubit(sl()));
}
