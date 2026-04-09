import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/use_cases/use_case_interface.dart';
import 'package:e_commerce/features/auth/domain/repo/auth_repo.dart';
import '../entities/user_entity.dart';
import '../../../../core/errors/failure.dart';

class LoginUseCase
    extends UseCase<UserEntity, SignInParams> {
  final AuthRepo repository;

  LoginUseCase(this.repository);

  @override
  Future<Either<Failure, UserEntity>> call(
    SignInParams signInParams,
  ) {
    return repository.login(email: signInParams.email, password: signInParams.password);
  }
}

class SignInParams {
  final String email;
  final String password;
  const SignInParams({
    required this.email,
    required this.password,
  });
}