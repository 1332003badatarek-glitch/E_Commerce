import 'package:e_commerce/core/use_cases/use_case_interface.dart';
import 'package:e_commerce/features/auth/domain/entities/user_entity.dart';
import 'package:e_commerce/features/auth/domain/use_cases/get_profile_use_case.dart';
import 'package:e_commerce/features/auth/domain/use_cases/login_use_case.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this._loginUseCase, this._getProfileUseCase)
    : super(LoginInitial());

  final LoginUseCase _loginUseCase;
  final GetProfileUseCase _getProfileUseCase;

  Future<void> login({required String email, required String password}) async {
    emit(LoginLoading());
    final loginResult = await _loginUseCase(
      LoginParams(email: email, password: password),
    );
    await loginResult.fold(
      (failure) async => emit(LoginFailure(erorrMessage: failure.message)),
      (_) async {
        final userProfileResult = await _getProfileUseCase(NoParams());
        userProfileResult.fold(
          (failure) => emit(LoginFailure(erorrMessage: failure.message)),
          (user) => emit(LoginSuccess(userEntity: user)),
        );
      },
    );
  }
}
