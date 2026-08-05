import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:riwaq/features/auth/domain/usecases/login_usecase.dart';
import 'package:riwaq/features/auth/presentation/cubit/login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginUseCase loginUseCase;

  LoginCubit(this.loginUseCase) : super(LoginInitial());

  Future<void> login({
    required String username,
    required String password,
  }) async {
    emit(LoginLoading());
    final result = await loginUseCase(username: username, password: password);

    result.fold(
      (failure) => emit(LoginError(failure.errMsg)),
      (user) => emit(LoginSuccess(user)),
    );
  }
}
