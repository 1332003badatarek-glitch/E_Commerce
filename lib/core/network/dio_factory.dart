import 'package:dio/dio.dart';
import 'package:e_commerce/core/network/api_constants.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'auth_interceptor.dart';

class DioFactory {
  DioFactory._();
  static Dio? _dio;

  static Dio initDio(AuthInterceptor authInterceptor) {
    Duration timeOut = const Duration(seconds: 30);

    if (_dio == null) {
      _dio = Dio(
        BaseOptions(
          baseUrl: ApiConstants.baseUrl,
          receiveDataWhenStatusError: true,
          connectTimeout: timeOut,
          receiveTimeout: timeOut,
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
          },
        ),
      );

      addDioInterceptors(authInterceptor);
      return _dio!;
    }
    return _dio!;
  }

  static void addDioInterceptors(AuthInterceptor authInterceptor) {
    _dio?.interceptors.add(authInterceptor);

    _dio?.interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        error: true,
        compact: true,
      ),
    );
  }
}
