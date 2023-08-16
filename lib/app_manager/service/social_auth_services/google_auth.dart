


import 'package:flutter/foundation.dart';
import 'package:flutter_boilerplate/app_manager/constant/environment.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleAuth {

   final GoogleSignIn _googleSignIn = GoogleSignIn(
   clientId: (defaultTargetPlatform == TargetPlatform.android || defaultTargetPlatform == TargetPlatform.iOS)?
   null:dotenv.env[Environment.googleClientId],
  );

  GoogleSignIn get instance => _googleSignIn;

  Future<GoogleSignInAccount?> signIn() async{
    try {
      GoogleSignInAccount? user =await _googleSignIn.signIn();
      return user;
    } catch (error) {
        rethrow;
    }
  }

  Future<void> signOut() async{
    try {
      await _googleSignIn.signOut();
    } catch (error) {
      rethrow;
    }
  }

}