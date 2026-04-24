part of 'user_cubit_cubit.dart';

abstract class UserState extends Equatable {
  const UserState();

  @override
  List<Object?> get props => [];
}

class UserInitial extends UserState {}

class UserLoading extends UserState {}

class UserSuccess extends UserState {
  final UserEntity user;
  const UserSuccess(this.user);
  @override
  List<Object?> get props => [user];
}

class UserFailure extends UserState {
  final String errorMessage;
  const UserFailure(this.errorMessage);
  @override
  List<Object?> get props => [errorMessage];
}
