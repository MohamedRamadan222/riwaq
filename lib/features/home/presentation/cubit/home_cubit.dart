import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:riwaq/features/home/domain/usecases/get_products_usecase.dart';
import 'package:riwaq/features/home/presentation/cubit/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final GetProductsUsecase getProductsUsecase;

  HomeCubit(this.getProductsUsecase) : super(HomeInitial());

  static const int pageSize = 10;
  int _skip = 0;
  bool _hasMore = true;

  Future<void> getProducts() async {
    _skip = 0;
    _hasMore = true;
    emit(HomeLoading());
    final result = await getProductsUsecase(limit: pageSize, skip: _skip);

    result.fold(
      (failure) => emit(HomeError(failure.errMsg)),
      (products) {
        _skip += products.length;
        _hasMore = products.length >= pageSize;
        emit(HomeSuccess(products, hasMore: _hasMore));
      },
    );
  }

  Future<void> loadMore() async {
    final current = state;
    if (current is! HomeSuccess ||
        !current.hasMore ||
        current.isLoadingMore) {
      return;
    }

    emit(HomeSuccess(
      current.products,
      hasMore: current.hasMore,
      isLoadingMore: true,
    ));

    final result = await getProductsUsecase(limit: pageSize, skip: _skip);

    result.fold(
      (failure) => emit(HomeSuccess(
        current.products,
        hasMore: current.hasMore,
      )),
      (products) {
        _skip += products.length;
        _hasMore = products.length >= pageSize;
        emit(HomeSuccess(
          [...current.products, ...products],
          hasMore: _hasMore,
        ));
      },
    );
  }
}