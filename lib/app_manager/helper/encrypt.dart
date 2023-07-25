


import 'package:encrypt/encrypt.dart';
import 'package:flutter_boilerplate/app_manager/constant/environment.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class Encrypt {

  static final String _encryptionKey = dotenv.env[Environment.encryptionKey]??"";
  static final _key = Key.fromUtf8(_encryptionKey);
  static final _iv = IV.fromLength(16);
  static final _encrypter = Encrypter(AES(_key,));

  static String encryption(String text) {
    final encrypted = _encrypter.encrypt(text, iv: _iv);
    return encrypted.base64;
  }

  static String decryption(String encryptedText) {
    final decrypted = _encrypter.decrypt(Encrypted.fromBase64(encryptedText), iv: _iv);
    return decrypted;
  }

}