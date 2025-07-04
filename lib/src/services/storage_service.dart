import 'package:shared_preferences/shared_preferences.dart';

import '../utilities/export.dart';

class StorageService {
  StorageService._();
  factory StorageService() => _instance;
  static final StorageService _instance = StorageService._();
  static StorageService get instance => _instance;

  Future<void> initialize() async {
    // Make sure that prefs is instantiated at the top since below commands needs to use _prefs
    _prefs = await SharedPreferences.getInstance();
    // This function will set the value of isLoggedIn, authModel and accessToken
  }

  late SharedPreferences _prefs;
  SharedPreferences get prefs => _prefs;

  late bool _isLoggedIn;
  bool get isLoggedIn => _isLoggedIn;

  Future<void> saveString(String key, String data) async {
    final bool isSuccess = await _prefs.setString(key, data);
    if (!isSuccess) {
      throw AppError.createError('Could not save string $key: $data');
    }
  }

  String? readString(String key) => _prefs.getString(key);

  Future<void> saveBool(String key, bool value) async {
    final bool isSuccess = await _prefs.setBool(key, value);
    if (!isSuccess) {
      throw AppError.createError('Could not save string $key: $value');
    }
  }

  bool readBool(String key) => _prefs.getBool(key) ?? false;

  Future<void> delete(String key) async => await _prefs.remove(key);
}
