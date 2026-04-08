import 'package:dio/dio.dart';
import 'package:e_commerce/core/network/api_constants.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioFactory {
  DioFactory._();
  static Dio? _dio;

  static Dio initDio() {
    Duration timeOut = const Duration(seconds:30);
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
      addDioInterceptor();
      return _dio!;
    } else {
      return _dio!;
    }
  }

  static void addDioInterceptor() {
    _dio?.interceptors.add(PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      error: true,
      
    ));
  }
}
