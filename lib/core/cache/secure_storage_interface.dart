abstract class SecureStorage {
  Future<void> saveSecureData({required String key, required String value});
  Future<String?> getSecureData(String key);
  Future<void> removeSecureData({required String key}); 
}