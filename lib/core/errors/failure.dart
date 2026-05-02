abstract class Failure {
  final String message;
  final int? statusCode;
  const Failure(this.message, {this.statusCode});
}

class NetworkFailure extends Failure {
  const NetworkFailure(super.message);
}

class ServerFailure extends Failure {
  const ServerFailure(super.message, {super.statusCode});
}

class CacheFailure extends Failure {
  const CacheFailure(super.message);
}

class ParsingFailure extends Failure {
  const ParsingFailure(super.message);
}
class UnknownFailure extends Failure {
  const UnknownFailure(super.message);
}

class BusinessFailure extends Failure {
  const BusinessFailure(super.message);
}






