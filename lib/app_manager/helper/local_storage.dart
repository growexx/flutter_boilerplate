import 'package:flutter_boilerplate/app_manager/helper/encrypt.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {

  static Future<bool> remove({
    required String key,
    SharedPreferences? pref,
  }) async {
      final prefs = pref ?? await SharedPreferences.getInstance();
      return await prefs.remove(key);
  }


  static Future<String?> getString({
    required String key,
    SharedPreferences? pref,
    bool useEncrypt = false,
  }) async {
      final prefs = pref ?? await SharedPreferences.getInstance();
      final storedData = prefs.getString(key);
      if(useEncrypt && storedData!=null) {
          return Encrypt.decryption(storedData);
      } else{
        return storedData;
      }
  }

  static Future setString({
    required String key,
    SharedPreferences? pref,
    bool useEncrypt = false,
    required String data,
  }) async {
        final prefs = pref ?? await SharedPreferences.getInstance();
        await prefs.setString(key, useEncrypt==true? Encrypt.encryption(data):data);
  }



}