import 'dart:convert';
import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/app_manager/api/api_call.dart';
import 'package:flutter_boilerplate/app_manager/api/project_response.dart';
import 'package:flutter_boilerplate/app_manager/component/bottom_sheet/custom_bottom_sheet.dart';
import 'package:flutter_boilerplate/app_manager/component/bottom_sheet/functional_sheet.dart';
import 'package:flutter_boilerplate/app_manager/constant/storage_constant.dart';
import 'package:flutter_boilerplate/app_manager/helper/local_storage.dart';
import 'package:flutter_boilerplate/app_manager/service/navigation_service.dart';
import 'package:flutter_boilerplate/app_manager/service/social_auth_services/google_auth.dart';
import 'package:flutter_boilerplate/authentication/user.dart';
import 'package:flutter_boilerplate/view/screens/change_password/change_password_screen.dart';
import 'package:flutter_boilerplate/view/screens/splash_screen.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class UserRepository extends ChangeNotifier {
  http.Client client = http.Client();
  User? currentUser;

  UserRepository({
    this.currentUser,
  });


  User get getUser => currentUser ?? User();
  bool get isLoggedIn => currentUser?.id != null;
  static UserRepository of(BuildContext context) =>
      Provider.of<UserRepository>(context, listen: false);

  final ApiCall _apiCall = ApiCall();

  Future updateUserData(User? userData) async {
    try {
      if (userData == null) {
        await LocalStorage.remove(key: StorageConstant.userStorage);
        currentUser = null;
      } else {
        String user = jsonEncode(userData.toJson());
        await LocalStorage.setString(
            key: StorageConstant.userStorage, data: user, useEncrypt: true);
        currentUser = await fetchUserData();
        log("current User is ${currentUser!.toJson()}");
      }
      notifyListeners();
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
  }

  static Future<User> fetchUserData() async {
    try {
      String? storedData = await LocalStorage.getString(
          key: StorageConstant.userStorage, useEncrypt: true);
      if (storedData != null) {
        return User.fromJson(jsonDecode(storedData));
      } else {
        return User();
      }
    } catch (e) {
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
    } catch (e) {
      rethrow;
    }
  }

  Future<bool?> refreshToken() async{
    try {
      var body = {
        "refreshToken": getUser.refreshToken ?? "",
      };
      ProjectResponse data = ProjectResponse.fromJson(await _apiCall.call(
        url: "auth/refresh-token",
        client: client,
        apiCallType: ApiCallType.post(body: body),));
      if(data.status == 1) {
        await updateToken(data.data["token"]);
        return true;
      } else {
        directLogOut(NavigationService.context!);
      }
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
    return null;
  }

  Future updateToken(String token) async {
    User newUserData = getUser;
    newUserData.token = token;
    updateUserData(newUserData);
  }

}
