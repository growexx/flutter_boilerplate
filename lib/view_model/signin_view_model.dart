import 'package:flutter/cupertino.dart';
import 'package:flutter_boilerplate/app_manager/api/api_call.dart';
import 'package:flutter_boilerplate/app_manager/api/project_response.dart';
import 'package:flutter_boilerplate/app_manager/enum/button_status.dart';
import 'package:flutter_boilerplate/app_manager/extension/to_sh256.dart';
import 'package:flutter_boilerplate/app_manager/helper/navigation/navigation_helper.dart';
import 'package:flutter_boilerplate/app_manager/helper/show_toast.dart';
import 'package:flutter_boilerplate/app_manager/service/navigation_service.dart';
import 'package:flutter_boilerplate/authentication/user.dart';
import 'package:flutter_boilerplate/view/screens/otp/otp_screen.dart';
import 'package:http/http.dart' as http;

class SignInViewModel extends ChangeNotifier {
  http.Client client = http.Client();
  var isRememberMeChecked = false;
  final TextEditingController emailC = TextEditingController();
  final TextEditingController passwordC = TextEditingController();

  bool get getRememberMe {
    return isRememberMeChecked;
  }

  final ApiCall _apiCall = ApiCall();

  ButtonStatus _loginStatus = ButtonStatus.initial;

  ButtonStatus get loginStatus => _loginStatus;

  set loginStatus(ButtonStatus val) {
    _loginStatus = val;
    notifyListeners();
  }


  Future<User?> signIn({
    required String email,
    required String password,
  }) async{
    try {
      loginStatus = ButtonStatus.hit;
      var body = {
        "email": email,
        "password": password.toSh256(),
      };
      ProjectResponse data = ProjectResponse.fromJson(await _apiCall.call(
          url: "auth/signin",
          client: client,
          apiCallType: ApiCallType.post(body: body)));
      loginStatus = ButtonStatus.complete;
      if(data.status == 1) {
        BuildContext? context = NavigationService.context;
        if(context!=null) {
          loginStatus = ButtonStatus.complete;
          return User.fromJson(data.data);

        }
      } else {
        showToast(data.message??"");
        if(data.data != null){
          if(data.data['is_active'] == 0) {
            //verifyEmail(data.data['email']);
          }
        }
      }
    } catch (e) {
      showToast(e.toString());
      loginStatus = ButtonStatus.error;
    }
    return null;
  }


  set setRememberMe(bool value) {
    isRememberMeChecked = value;
    notifyListeners();
  }

  void signInWithOTP(BuildContext context) {
    NavigationHelper.pushNamed(context, OTPScreen.name);
  }
}
