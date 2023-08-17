import 'package:flutter/cupertino.dart';
import 'package:flutter_boilerplate/app_manager/helper/show_toast.dart';
import 'package:flutter_boilerplate/app_manager/service/social_auth_services/apple_auth.dart';
import 'package:flutter_boilerplate/app_manager/service/social_auth_services/google_auth.dart';
import 'package:flutter_boilerplate/authentication/user.dart';
// import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

class SocialSignInViewModel extends ChangeNotifier {
  GoogleAuth googleAuth = GoogleAuth();
  AppleAuth appleAuth = AppleAuth();

  Future<User?> signinWithGoogle() async {
    try {
      GoogleSignInAccount? user = await googleAuth.signIn();
      if (user != null) {
        List<String> name = (user.displayName ?? "").split(" ");
        return User(
          id: user.id,
          firstName: name[0],
          lastName: name[1],
          profileUrl: user.photoUrl,
            email: user.email
        );
      } else {
          showToast("No User Found",);
      }
    } catch (e) {
      showToast(e.toString(),);
      rethrow;
    }
    return null;
  }

  Future<User?> signinWithApple() async {
    try {
      AuthorizationCredentialAppleID? user = await appleAuth.getAppleIDCredential();
      if(user!=null) {
        return User(
          id: user.userIdentifier,
          firstName: user.givenName,
          lastName: user.familyName,
        );
      }

    } catch (e) {
      showToast(e.toString(),);
      rethrow;
    }
    return null;
  }

  Future<User?> signinWithFaceBook() async {
    try {
      // LoginResult? user = await _fbAuth.login();
      // if(user!=null && user.accessToken!=null) {
      //   return User(
      //     id: (user.accessToken ?? "").toString(),
      //   );
      // }

    } catch (e) {
      showToast(e.toString(),);
      rethrow;
    }
    return null;
  }

  Future<User?> signinWithTwitter() async {
    // try {
    //   AuthResult? user = await _twitterAuth.login();
    //   if(user!=null) {
    //     return User(
    //       id: (user.user?.id ?? "").toString(),
    //       firstName: (user.user?.name ?? "").toString(),
    //     );
    //   }
    //
    // } catch (e) {
    //   showToast(e.toString(),);
    //   rethrow;
    // }
    return null;
  }
}
