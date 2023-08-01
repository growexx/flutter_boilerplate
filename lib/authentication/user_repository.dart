import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/app_manager/component/bottom_sheet/custom_bottom_sheet.dart';
import 'package:flutter_boilerplate/app_manager/component/bottom_sheet/functional_sheet.dart';
import 'package:flutter_boilerplate/app_manager/constant/storage_constant.dart';
import 'package:flutter_boilerplate/app_manager/helper/local_storage.dart';
import 'package:flutter_boilerplate/app_manager/service/social_auth_services/google_auth.dart';
import 'package:flutter_boilerplate/authentication/user.dart';
import 'package:flutter_boilerplate/view/screens/change_password/change_password_screen.dart';
import 'package:flutter_boilerplate/view/screens/splash/splash_screen.dart';
import 'package:go_router/go_router.dart';

class UserRepository extends ChangeNotifier {

  User? currentUser;

  UserRepository({
    this.currentUser,
  });
  
  
  bool get isLoggedIn => currentUser?.id != null;

  Future updateUserData(User? userData) async {
    try{
      if(userData==null) {
        await LocalStorage.remove(key: StorageConstant.userStorage);
        currentUser = null;
      } else{
        String user = jsonEncode(userData.toJson());
        await LocalStorage.setString(key: StorageConstant.userStorage, data: user,useEncrypt: true);
        currentUser = await fetchUserData();
      }

      notifyListeners();
    } catch(e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }}

  static Future<User> fetchUserData() async {
    try {
      String? storedData = await LocalStorage.getString(key: StorageConstant.userStorage,useEncrypt: true);
      if(storedData!=null) {
        return User.fromJson(
            jsonDecode( storedData));
      } else {
        return User();
      }
    } catch(e) {
      return User();
    }
  }

  void changePassword(BuildContext context) {
    Router.neglect(context, () => context.goNamed(ChangePasswordScreen.name));
  }

  Future signOutUser(BuildContext context) async {
    CustomBottomSheet.open(context,
        child: FunctionalSheet(
          key: const Key("sign_out"),
            message: "Do you want to Sign Out?",
            buttonName: "Sign Out",
            onPressButton: () async {
              directLogOut(context);
            }));
  }



  Future directLogOut(BuildContext context) async {
    try {
      await GoogleAuth().signOut();
      await updateUserData(null).then((value) {
        while (context.canPop()) {
          context.pop();
        }
        Router.neglect(context, () => context.goNamed(SplashScreen.name));
      });
    } catch(e) {
      rethrow;
    }
  }

}
