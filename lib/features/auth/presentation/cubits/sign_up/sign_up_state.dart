part of 'sign_up_cubit.dart';

abstract class SignUpState extends Equatable {
  const SignUpState();

  @override
  List<Object> get props => [];
}

class SignUpInitial extends SignUpState {}

class SignUpLoading extends SignUpState {}

class SignUpSuccess extends SignUpState {
  final UserEntity userEntity;

  const SignUpSuccess({required this.userEntity});

  @override
  List<Object> get props => [userEntity];
}

class SignUpFailure extends SignUpState {
  final String erorrMessage;

  const SignUpFailure({required this.erorrMessage});

  @override
  List<Object> get props => [erorrMessage];
}
