import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../helpers/cache_helper.dart';

final getIt = GetIt.instance; 

Future<void> setupServiceLocator() async {
  final sharedPrefs = await SharedPreferences.getInstance();
  getIt.registerLazySingleton<SharedPreferences>(() => sharedPrefs);
  getIt.registerLazySingleton<FlutterSecureStorage>(() => const FlutterSecureStorage());


  getIt.registerLazySingleton<CacheHelper>(
    () => CacheHelper(getIt<SharedPreferences>(), getIt<FlutterSecureStorage>()),
  );


  getIt.registerLazySingleton<LocalStorage>(() => getIt<CacheHelper>());
  getIt.registerLazySingleton<SecureStorage>(() => getIt<CacheHelper>());
}