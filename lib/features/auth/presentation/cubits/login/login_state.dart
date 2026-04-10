part of 'login_cubit.dart';

abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {
  final UserEntity userEntity;

  @override
  List<Object> get props => [userEntity];

  const LoginSuccess({required this.userEntity});
}

class LoginFailure extends LoginState {
  final String erorrMessage;

  const LoginFailure({required this.erorrMessage});

  @override
  List<Object> get props => [erorrMessage];
}
