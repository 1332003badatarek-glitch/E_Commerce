part of 'sign_up_cubit.dart';

abstract class SignUpState extends Equatable {
  const SignUpState();

  @override
  List<Object> get props => [];
}

class SignUpInitial extends SignUpState {}

class SignUpLoading extends SignUpState {}

class SignUpSuccess extends SignUpState {
  final UserEntity user;

  const SignUpSuccess({required this.user});

  @override
  List<Object> get props => [user];
}

class SignUpFailure extends SignUpState {
  final String erorrMessage;

 const SignUpFailure({required this.erorrMessage});

  @override
  List<Object> get props => [erorrMessage];

}
