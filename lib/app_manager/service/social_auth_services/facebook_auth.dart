
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class FbAuth {

  final FacebookAuth _facebookAuth = FacebookAuth.instance;

 Future<LoginResult?> login() async{
    try {
      LoginResult? user =await _facebookAuth.login();
      return user;
    } catch (error) {
      rethrow;
    }
  }

  Future<void> logOut() async{
    try {
      await _facebookAuth.logOut();
    } catch (error) {
      rethrow;
    }
  }
}