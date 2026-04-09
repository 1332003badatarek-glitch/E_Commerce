import 'package:dartz/dartz.dart';
import '../errors/failure.dart';


// Params: هو نوع البيانات اللي داخلة (ممكن يكون كلاس، ريكورد، أو NoParams)
abstract class UseCase<T, Params> {
  Future<Either<Failure, T>> call(Params params);
}

class NoParams {}