
import 'package:flutter/foundation.dart';
import 'package:flutter_boilerplate/app_manager/constant/environment.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

class AppleAuth {


  Future<AuthorizationCredentialAppleID?> getAppleIDCredential() async{
    try {
      AuthorizationCredentialAppleID credential = await SignInWithApple.getAppleIDCredential(
        scopes: [
          AppleIDAuthorizationScopes.email,
          AppleIDAuthorizationScopes.fullName,
        ],
        webAuthenticationOptions:
        (defaultTargetPlatform == TargetPlatform.iOS)?
        null:
        WebAuthenticationOptions(
            clientId: dotenv.env[Environment.appleClientId]!,
            redirectUri: Uri.parse(dotenv.env[Environment.firebaseRedirectURI]??""),),
      );
      return credential;
    } catch (error) {
      rethrow;
    }
  }

}