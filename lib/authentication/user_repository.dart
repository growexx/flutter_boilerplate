import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/app_manager/component/bottom_sheet/custom_bottom_sheet.dart';
import 'package:flutter_boilerplate/app_manager/component/bottom_sheet/functional_sheet.dart';
import 'package:flutter_boilerplate/app_manager/constant/storage_constant.dart';
import 'package:flutter_boilerplate/authentication/user.dart';
import 'package:flutter_boilerplate/view/screens/splash_screen.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
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
      const storage = FlutterSecureStorage();
      await storage.delete(key: StorageConstant.userStorage);
      currentUser = null;
    } else{
      String user = jsonEncode(userData.toJson());
      const storage = FlutterSecureStorage();
      await storage.write(key: StorageConstant.userStorage, value: user);
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
    const storage = FlutterSecureStorage();
    var user = await storage.read(key: StorageConstant.userStorage, );
    return User.fromJson(
        jsonDecode( user ?? "{}"));
  } catch(e) {
    return User();
  }
  }

  Future signOutUser(BuildContext context) async {
    CustomBottomSheet.open(context,
        child: FunctionalSheet(
            message: "Do you want to Sign Out?",
            buttonName: "Sign Out",
            onPressButton: () async {
              directLogOut(context);
            }));
  }



  Future directLogOut(BuildContext context) async {
    await updateUserData(null).then((value) {
      while (context.canPop()) {
        context.pop();
      }
      Router.neglect(context, () => context.goNamed(SplashScreen.name));
    });
    notifyListeners();
  }

}
