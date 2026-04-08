import 'package:dio/dio.dart';
import 'package:e_commerce/core/errors/failure.dart';

class ErrorHandler {
  static Failure handle(dynamic error) {
    if (error is DioException) {
      switch (error.type) {
        case DioExceptionType.connectionTimeout:
        case DioExceptionType.sendTimeout:
        case DioExceptionType.receiveTimeout:
        case DioExceptionType.connectionError:
          return const NetworkFailure('Connection error please try again later');
        

        case DioExceptionType.badResponse:
          final message = error.response?.data['message'] ?? "Server error please try again later";
          return ServerFailure(message, statusCode: error.response?.statusCode);

        case DioExceptionType.cancel:
          return const UnknownFailure("Request was cancelled");

      
        case DioExceptionType.unknown:
          if (error.message != null && error.message!.contains('TypeError')) {
             return const ParsingFailure("Data processing error (Parsing Failure)");
          }
          return UnknownFailure(error.message ?? 'Unknown error please try again later');

        default:
          return const UnknownFailure('Something went wrong, please try again');
      }
    } else {
      return const UnknownFailure("An unexpected error occurred");
    }
  }
}