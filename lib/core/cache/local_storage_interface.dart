abstract class LocalStorage {
  Future<bool> saveData({required String key, required dynamic value});
  dynamic getData({required String key});
  Future<bool> removeData({required String key});
}
