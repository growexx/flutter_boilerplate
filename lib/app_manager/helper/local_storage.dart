import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {



  static Future<bool> remove({
    required String key,
    SharedPreferences? pref,
  }) async {
      final prefs = pref ?? await SharedPreferences.getInstance();
      return await prefs.remove(key);
  }


  static Future<String?> fetch({
    required String key,
    SharedPreferences? pref,
  }) async {
      final prefs = pref ?? await SharedPreferences.getInstance();
      return prefs.getString(key);
  }

  static Future update({
    required String key,
    SharedPreferences? pref,
    required String data,
  }) async {
        final prefs = pref ?? await SharedPreferences.getInstance();
        await prefs.setString(key, data);
  }



}