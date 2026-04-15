import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/use_cases/use_case_interface.dart';
import 'package:e_commerce/features/auth/domain/repo/auth_repo.dart';
import '../../../../core/errors/failure.dart';

class LoginUseCase extends UseCase<Unit, LoginParams> {
  final AuthRepo repository;

  LoginUseCase(this.repository);

  @override
  Future<Either<Failure, Unit>> call(LoginParams signInParams) async {
    return await repository.login(
      email: signInParams.email,
      password: signInParams.password,
    );
  }
}
class LoginParams {
  final String email;
  final String password;
  const LoginParams({required this.email, required this.password});
}
