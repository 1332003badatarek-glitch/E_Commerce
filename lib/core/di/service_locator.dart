import 'package:dio/dio.dart';
import 'package:e_commerce/features/auth/data/data_sources/remote/auth_api_service.dart';
import 'package:e_commerce/features/auth/data/data_sources/remote/files_api_service.dart';
import 'package:e_commerce/features/auth/data/repo/auth_repo_ipml.dart';
import 'package:e_commerce/features/auth/data/repo/files_repo_impl.dart';
import 'package:e_commerce/features/auth/domain/repo/files_repo.dart';
import 'package:e_commerce/features/auth/domain/use_cases/sign_up_use_case.dart';
import 'package:e_commerce/features/auth/domain/use_cases/upload_image_use_case.dart';
import 'package:e_commerce/features/auth/presentation/cubits/login/login_cubit.dart';
import 'package:e_commerce/features/auth/presentation/cubits/sign_up/sign_up_cubit.dart';
import 'package:e_commerce/features/categories/data/data_source/remote/category_api_service.dart';
import 'package:e_commerce/features/categories/data/repos/category_repo_impl.dart';
import 'package:e_commerce/features/categories/domain/repos/category_repo.dart';
import 'package:e_commerce/features/categories/domain/use_cases/get_categories_use_case.dart';
import 'package:e_commerce/features/categories/presentation/cubits/categories/categories_cubit.dart';
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
  getIt.registerLazySingleton<FilesApiService>(
    () => FilesApiService(getIt<Dio>()),
  );

  // Repository Implementation
  getIt.registerLazySingleton<AuthRepo>(
    () => AuthRepoImpl(getIt<AuthApiService>(), getIt<SecureStorage>()),
  );
  getIt.registerLazySingleton<FilesRepo>(
    () => FilesRepoImpl(getIt<FilesApiService>()),
  );

  // Use Cases
  getIt.registerLazySingleton<LoginUseCase>(
    () => LoginUseCase(getIt<AuthRepo>()),
  );

  getIt.registerLazySingleton<SignUpUseCase>(
    () => SignUpUseCase(getIt<AuthRepo>()),
  );

  getIt.registerLazySingleton<UploadImageUseCase>(
    () => UploadImageUseCase(getIt<FilesRepo>()),
  );

  // Cubits

  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt<LoginUseCase>()));

  getIt.registerFactory<SignUpCubit>(
    () => SignUpCubit(getIt<SignUpUseCase>(), getIt<UploadImageUseCase>()),
  );

  //! Categories feature

  // Data Source
  getIt.registerLazySingleton<CategoryApiService>(
    () => CategoryApiService(getIt<Dio>()),
  );

  // Repository Implementation
  getIt.registerLazySingleton<CategoryRepo>(
    () => CategoryRepoImpl(getIt<CategoryApiService>()),
  );

  // Use Case
  getIt.registerLazySingleton<GetCategoriesUseCase>(
    () => GetCategoriesUseCase(getIt<CategoryRepo>()),
  );

  // Cubit
  getIt.registerFactory<CategoriesCubit>(
    () => CategoriesCubit(getIt<GetCategoriesUseCase>()),
  );
}
