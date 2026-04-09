import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/errors/failure.dart';
import 'package:e_commerce/core/use_cases/use_case_interface.dart';
import 'package:e_commerce/features/auth/domain/entities/user_entity.dart';
import 'package:e_commerce/features/auth/domain/repo/auth_repo.dart';

class SignUpUseCase extends UseCase<UserEntity, SignUpParams> {
  final AuthRepo repository;

  SignUpUseCase(this.repository);
  @override
  Future<Either<Failure, UserEntity>> call(SignUpParams signUpParams) {
    return repository.signUp(
      name: signUpParams.name,
      email: signUpParams.email,
      password: signUpParams.password,
      avatar: signUpParams.avatar,
    );
  }
}

class SignUpParams {
  final String name;
  final String email;
  final String password;
  final String avatar;

 const SignUpParams(
     {
      required this.name,
    required this.email,
    required this.password,
    required this.avatar,
  });
}
