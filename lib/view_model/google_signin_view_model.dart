

import 'package:flutter/cupertino.dart';
import 'package:flutter_boilerplate/app_manager/helper/show_toast.dart';
import 'package:flutter_boilerplate/app_manager/service/social_auth_services/google_auth.dart';
import 'package:flutter_boilerplate/authentication/user.dart';
import 'package:google_sign_in/google_sign_in.dart';




class GoogleSigninViewModel extends ChangeNotifier {


  final GoogleAuth _googleAuth = GoogleAuth();

  Future<User?> signin() async{
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


}