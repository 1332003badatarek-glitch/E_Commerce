import 'package:e_commerce/core/cache/local_storage_interface.dart';
import 'package:e_commerce/core/cache/secure_storage_interface.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';




class CacheHelper implements LocalStorage, SecureStorage {
  final SharedPreferences _prefs;
  final FlutterSecureStorage _secureStorage;

  CacheHelper(this._prefs, this._secureStorage);

  @override
  Future<bool> saveData({required String key, required dynamic value}) async {
    if (value is int) return await _prefs.setInt(key, value);
    if (value is double) return await _prefs.setDouble(key, value);
    if (value is String) return await _prefs.setString(key, value);
    if (value is bool) return await _prefs.setBool(key, value);
    if (value is List<String>) return await _prefs.setStringList(key, value);
    return false;
  }

  @override
  dynamic getData({required String key}) {
    return _prefs.get(key);
  }

  @override

  Future<bool> removeData({required String key}) async {
    return await _prefs.remove(key);
  }

  @override
  Future<void> saveSecureData({
    required String key,
    required String value,
  }) async {
    await _secureStorage.write(key: key, value: value);
  }

  @override
  Future<String?> getSecureData(String key) async {
    return await _secureStorage.read(key: key);
  }

  @override
  Future<void> removeSecureData({required String key}) async {
    await _secureStorage.delete(key: key);
  }
}
