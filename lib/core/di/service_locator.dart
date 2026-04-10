import 'package:dio/dio.dart';
import 'package:e_commerce/features/auth/data/data_sources/remote/auth_api_service.dart';
import 'package:e_commerce/features/auth/data/repo/auth_repo_ipml.dart';
import 'package:e_commerce/features/auth/presentation/cubits/login_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:e_commerce/core/cache/cache_helper.dart';
import 'package:e_commerce/core/cache/local_storage_interface.dart';
import 'package:e_commerce/core/cache/secure_storage_interface.dart';
import 'package:e_commerce/core/network/auth_interceptor.dart';
import 'package:e_commerce/core/network/dio_factory.dart';
import 'package:e_commerce/features/auth/domain/repo/auth_repo.dart';
import 'package:e_commerce/features/auth/domain/use_cases/login_use_case.dart';

final getIt = GetIt.instance;

Future<void> setupServiceLocator() async {
  //core
  final sharedPrefs = await SharedPreferences.getInstance();
  getIt.registerLazySingleton<SharedPreferences>(() => sharedPrefs);
  getIt.registerLazySingleton<FlutterSecureStorage>(
    () => const FlutterSecureStorage(),
  );

  getIt.registerLazySingleton<CacheHelper>(
    () =>
        CacheHelper(getIt<SharedPreferences>(), getIt<FlutterSecureStorage>()),
  );

  getIt.registerLazySingleton<LocalStorage>(() => getIt<CacheHelper>());
  getIt.registerLazySingleton<SecureStorage>(() => getIt<CacheHelper>());

  // Netwoek
  getIt.registerLazySingleton<AuthInterceptor>(
    () => AuthInterceptor(getIt<SecureStorage>()),
  );

  getIt.registerLazySingleton<Dio>(
    () => DioFactory.initDio(getIt<AuthInterceptor>()),
  );

  //! Auth feature

  // Data Source
  getIt.registerLazySingleton<AuthApiService>(
    () => AuthApiService(getIt<Dio>()),
  );

  // Repository Implementation
  getIt.registerLazySingleton<AuthRepo>(
    () => AuthRepoImpl(getIt<AuthApiService>(), getIt<SecureStorage>()),
  );

  // Use Cases
  getIt.registerLazySingleton<LoginUseCase>(
    () => LoginUseCase(getIt<AuthRepo>()),
  );

  // Cubits
  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt<LoginUseCase>()));
}
