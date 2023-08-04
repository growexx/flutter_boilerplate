import 'dart:convert';

import 'package:flutter_boilerplate/app_manager/enum/button_status.dart';
import 'package:flutter_boilerplate/view_model/signin_view_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/testing.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    SharedPreferences.setMockInitialValues({});
  });

  test('SignInViewModel test', () {
    final model = SignInViewModel();
    model.isRememberMeChecked=false;
    expect(model.isRememberMeChecked, false);
    model.isRememberMeChecked=true;
    expect(model.isRememberMeChecked, true);
    model.emailC.text = "jaimin.modi@growexx.com";
    expect(model.emailC.text, "jaimin.modi@growexx.com");
    model.passwordC.text = "Test@123";
    expect(model.passwordC.text, "Test@123");
    model.setRememberMe=false;
    expect(model.getRememberMe,false);
    model.loginStatus=ButtonStatus.error;
    expect(model.loginStatus, ButtonStatus.error);
    model.loginStatus=ButtonStatus.complete;
    expect(model.loginStatus, ButtonStatus.complete);
    model.loginStatus=ButtonStatus.initial;
    expect(model.loginStatus, ButtonStatus.initial);
    model.loginStatus=ButtonStatus.hit;
    expect(model.loginStatus, ButtonStatus.hit);
  });

  test(
    "sign-in api response test",
        () async {
      final mockClient = MockClient((request) async {
        return http.Response(
            json.encode({
              "status": 1,
              "data": {
                "id": "c4411954-1ae8-44d3-aa62-3238c6c4a247",
                "email": "syed.raza@growexx.com",
                "first_name": "Syed",
                "last_name": "Raza",
                "profile_url": "https://lh3.googleusercontent.com/a/AAcHTtd7auRtGuCeGoZCgjG8s2RPlIZAFeRFi2DHiGC6=s96-c",
                "role": 1,
                "is_subscriber": 1,
                "is_active": 1,
                "is_google_user": 0,
                "is_premium": 0,
                "is_active_plan_cancelled": 0,
                "is_walkthrough_completed": 1,
                "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6ImM0NDExOTU0LTFhZTgtNDRkMy1hYTYyLTMyMzhjNmM0YTI0NyIsImVtYWlsIjoic3llZC5yYXphQGdyb3dleHguY29tIiwiaWF0IjoxNjkxMTM0MDQ2LCJleHAiOjE2OTEyMjA0NDZ9.-RGvJPh2NTCVwoLxZRCaQR9C_-PERzEmf8YN_3o5_GU",
                "refreshToken": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6ImM0NDExOTU0LTFhZTgtNDRkMy1hYTYyLTMyMzhjNmM0YTI0NyIsImVtYWlsIjoic3llZC5yYXphQGdyb3dleHguY29tIiwiaWF0IjoxNjkxMTM0MDQ2LCJleHAiOjE2OTM3MjYwNDZ9.KgWFTo04K9lNO7rsC6e6lskeRpde_sU1t7zqLsjRfEc"
              },
              "message": "User successfully logged in"
            }),
            200);
      });

      final model = SignInViewModel();
      model.client = mockClient;
      expect(model.loginStatus, ButtonStatus.initial);
      await model.signIn(
          email: "syed.raza@growexx.com", password: "Test@123");

      expect(model.loginStatus, ButtonStatus.error);
    },
  );
}
