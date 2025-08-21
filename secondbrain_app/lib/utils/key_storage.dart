import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class KeyStorage {
  static final FlutterSecureStorage _storage = const FlutterSecureStorage();

  static const String _keyName = "userGeminiKey";

  // save
  static Future<void> saveKey(String key) async {
    await _storage.write(key: _keyName, value: key);
  }

  // get
  static Future<String?> getKey() async {
    return await _storage.read(key: _keyName);
  }

  static Future<void> deleteKey() async {
    return await _storage.delete(key: _keyName);
  }
}
