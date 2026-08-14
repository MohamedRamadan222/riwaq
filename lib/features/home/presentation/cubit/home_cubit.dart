import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:riwaq/features/home/domain/usecases/get_products_usecase.dart';
import 'package:riwaq/features/home/presentation/cubit/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final GetProductsUsecase getProductsUsecase;

  HomeCubit(this.getProductsUsecase) : super(HomeInitial());

  Future<void> getProducts() async {
    emit(HomeLoading());
    final result = await getProductsUsecase();

    result.fold(
      (failure) => emit(HomeError(failure.errMsg)),
      (products) => emit(HomeSuccess(products)),
    );
  }
}