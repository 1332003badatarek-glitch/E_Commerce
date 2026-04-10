import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/use_cases/use_case_interface.dart';
import 'package:e_commerce/features/auth/domain/repo/auth_repo.dart';
import '../entities/user_entity.dart';
import '../../../../core/errors/failure.dart';

class LoginUseCase extends UseCase<UserEntity, LoginParams> {
  final AuthRepo repository;

  LoginUseCase(this.repository);

  @override
  Future<Either<Failure, UserEntity>> call(LoginParams signInParams) async {
    final loginResult = await repository.login(
      email: signInParams.email,
      password: signInParams.password,
    );

    return await loginResult.fold((failure) async => Left(failure), (_) async {
      return await repository.getProfile();
    });
  }
}

class LoginParams {
  final String email;
  final String password;
  const LoginParams({required this.email, required this.password});
}
