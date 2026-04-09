import 'package:dio/dio.dart';
import 'package:e_commerce/core/network/api_constants.dart';
import '../cache/secure_storage_interface.dart';

class AuthInterceptor extends Interceptor {
  final SecureStorage _secureStorage;
  final Dio _refreshDio = Dio();

   AuthInterceptor(this._secureStorage);

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final token = await _secureStorage.getSecureData(ApiConstants.accessToken);
    if (token != null) {
      options.headers['Authorization'] = 'Bearer $token';
    }
    return handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 401) {
      try {
        final refreshToken = await _secureStorage.getSecureData(
          ApiConstants.refreshToken,
        );

        if (refreshToken != null) {
          final response = await _refreshDio.post(
            ApiConstants.refreshTokenEndpoint,
            data: {ApiConstants.refreshToken: refreshToken},
          );

          if (response.statusCode == 200) {
            final newToken = response.data[ApiConstants.accessToken];
            await _secureStorage.saveSecureData(
              key: ApiConstants.accessToken,
              value: newToken,
            );

            final options = err.requestOptions;
            options.headers['Authorization'] = 'Bearer $newToken';

            final originResponse = await Dio().fetch(options);
            return handler.resolve(originResponse);
          }
        }
      } catch (e) {
        await _secureStorage.removeSecureData(key: ApiConstants.accessToken);
        await _secureStorage.removeSecureData(key: ApiConstants.refreshToken);
      }
    }

    return handler.next(err);
  }
}
