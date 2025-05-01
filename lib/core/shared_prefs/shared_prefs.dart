import 'package:shared_preferences/shared_preferences.dart';




class SharedPrefs {
  static SharedPreferences? _prefs;

  static Future<void> init() async {
    _prefs ??= await SharedPreferences.getInstance();
  }

  static Future<void> setString(String key, String value) async {
    await _prefs?.setString(key, value);
  }

  static Future<void> setInt(String key, int value) async {
    await _prefs?.setInt(key, value);
  }

  static int? getInt(String key) {
    return _prefs?.getInt(key);
  }

  static String? getString(String key) {
    return _prefs?.getString(key);
  }

  static Future<bool> remove(String key) async {
    return await _prefs?.remove(key) ?? false;
  }
}

// class SharedPrefs {
//   static SharedPreferences? _prefs;
//
//
//
//   static Future<SharedPreferences> get _instance async {
//     return _prefs ??= await SharedPreferences.getInstance();
//   }
//
//   static Future<void> setString(String key, String value) async {
//     final prefs = await _instance;
//     await prefs.setString(key, value);
//   }
//
//   static Future<void> setInt(String key, int value) async {
//     final prefs = await _instance;
//     await prefs.setInt(key, value);
//   }
//
//   static Future<int?> getInt(String key) async {
//     final prefs = await _instance;
//     return prefs.getInt(key);
//   }
//
//   static Future<String?> getString(String key) async {
//     final prefs = await _instance;
//     return prefs.getString(key);
//   }
//
//   static Future<bool> remove(String key) async {
//     final prefs = await _instance;
//     return await prefs.remove(key);
//   }
// }
