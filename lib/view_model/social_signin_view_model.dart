

import 'package:flutter/cupertino.dart';
import 'package:flutter_boilerplate/app_manager/helper/show_toast.dart';
import 'package:flutter_boilerplate/app_manager/service/social_auth_services/apple_auth.dart';
// import 'package:flutter_boilerplate/app_manager/service/social_auth_services/facebook_auth.dart';
import 'package:flutter_boilerplate/app_manager/service/social_auth_services/google_auth.dart';
import 'package:flutter_boilerplate/authentication/user.dart';
// import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';




class SocialSignInViewModel extends ChangeNotifier {


  final GoogleAuth _googleAuth = GoogleAuth();
  final AppleAuth _appleAuth = AppleAuth();
  // final FbAuth _fbAuth = FbAuth();

  Future<User?> signinWithGoogle() async{
    try {
      GoogleSignInAccount? user = await _googleAuth.signIn();
      if(user!=null) {
        List<String> name = (user.displayName ?? "").split(" ");
        return User(
          id: user.id,
          firstName: name[0],
          lastName: name[1],
          profileUrl: user.photoUrl,
        );
      } else {
        showToast("No User Found");
      }
    } catch (e) {
      showToast(e.toString());
      rethrow;
    }
    return null;
  }


  Future<User?> signinWithApple() async{
    try {
      AuthorizationCredentialAppleID? user = await _appleAuth.getAppleIDCredential();
        return User(
          id: user.userIdentifier,
          firstName: user.givenName,
          lastName: user.familyName,
        );
    } catch (e) {
      showToast(e.toString());
      rethrow;
    }
  }



  Future<User?> signinWithFaceBook() async{
    try {
      // LoginResult? user = await _fbAuth.login();
      // return User(
      //   id: (user?.accessToken ?? "").toString(),
      // );
    } catch (e) {
      showToast(e.toString());
      rethrow;
    }
    return null;
  }


}