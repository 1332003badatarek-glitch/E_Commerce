import 'package:e_commerce/features/auth/domain/use_cases/login_use_case.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this._loginUseCase) : super(LoginInitial());

  final LoginUseCase _loginUseCase;

  Future<void> login({required String email, required String password}) async {
    emit(LoginLoading());

    final loginResult = await _loginUseCase(
      LoginParams(email: email, password: password),
    );

    loginResult.fold(
      (failure) => emit(LoginFailure(errorMessage: failure.message)),
      (_) => emit(LoginSuccess()),
    );
  }
}
