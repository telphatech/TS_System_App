import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceService {
  late SharedPreferences _sharedPreferences;

  SharedPreferencesService() {
    initialise();
  }

  Future<void> initialise() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  static const String EMP_UID = "empUID";
  static const String EMAIL = "email";
  static const String PHONE = "phone";
  static const String ROLE = "role";
  static const String NAME = "name";
  static const String TOKEN = "token";
  static const String IsLoggedIn = "isLoggedIn";

  void _saveToDisk<T>(String key, T content) {
    if (content is String) {
      _sharedPreferences.setString(key, content);
    }
    if (content is bool) {
      _sharedPreferences.setBool(key, content);
    }
    if (content is double) {
      _sharedPreferences.setDouble(key, content);
    }
    if (content is int) {
      _sharedPreferences.setInt(key, content);
    }
    if (content is List<String>) {
      _sharedPreferences.setStringList(key, content);
    }
  }

  dynamic _getFromDisk(String key) {
    var value = _sharedPreferences.get(key);
    return value;
  }

  Future<void> clearLoginData() async {
    await _sharedPreferences.remove(EMP_UID);
    await _sharedPreferences.remove(EMAIL);
    await _sharedPreferences.remove(PHONE);
    await _sharedPreferences.remove(ROLE);
    await _sharedPreferences.remove(NAME);
    await _sharedPreferences.remove(TOKEN);
    await _sharedPreferences.remove(IsLoggedIn);
  }

  String get empID => _getFromDisk(EMP_UID) ?? "";
  set empID(String value) => _saveToDisk(EMP_UID, value);

  String get email => _getFromDisk(EMAIL) ?? "";
  set email(String value) => _saveToDisk(EMAIL, value);

  String get phone => _getFromDisk(PHONE) ?? "";
  set phone(String value) => _saveToDisk(phone, value);

  String get role => _getFromDisk(ROLE) ?? "";
  set role(String value) => _saveToDisk(ROLE, value);

  String get name => _getFromDisk(NAME) ?? "";
  set name(String value) => _saveToDisk(NAME, value);

  String get token => _getFromDisk(TOKEN) ?? "";
  set token(String value) => _saveToDisk(TOKEN, value);

  bool get isLoggedIn => _getFromDisk(IsLoggedIn) ?? false;
  set isLoggedIn(bool value) => _saveToDisk(IsLoggedIn, value);
}
