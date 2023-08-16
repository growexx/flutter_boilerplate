import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/app_manager/service/navigation_service.dart';
import 'package:flutter_boilerplate/authentication/user.dart';
import 'package:flutter_boilerplate/authentication/user_repository.dart';
import 'package:flutter_boilerplate/view/screens/dashboard/dashboard_screen.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/testing.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../util/common_initial_activity.dart';
import 'package:http/http.dart' as http;

import '../util/testing_material_app.dart';

void main() async {
  TestWidgetsFlutterBinding.ensureInitialized();
  late UserRepository model;
  await commonInitialActivity();
  setUpAll(() async {
    model = UserRepository();
    SharedPreferences.setMockInitialValues({});
    await dotenv.load();
  });

  group('UserRepository', () {
    test(
      "initial values",
      () {
        expect(model.currentUser?.id, isNull);
        expect(model.isLoggedIn, false);
      },
    );

    test(
      "add data",
      () async {
        model = UserRepository(currentUser: User(firstName: "test"));
        await model.updateUserData(User(firstName: "test"));
        expect(model.currentUser?.firstName, "test");

        await model.updateUserData(null);
        expect(model.currentUser?.firstName, null);
      },
    );
    test(
      "show fetched data",
      () async {
        User user = await UserRepository.fetchUserData();
        expect(user.email, isNull);
      },
    );

    test(
      "fetch user token info from api",
      () async {
        final mockClient = MockClient((request) async {
          return http.Response(json.encode({"refreshToken": "token"}), 200);
        });
        final model = UserRepository();
        model.client = mockClient;
        await model.refreshToken();
        expect(model.currentUser?.token, isNull);
      },
    );

    test(
      "fetch user token info from api when status is 1",
      () async {
        final mockClient = MockClient((request) async {
          return http.Response(
              json.encode({
                "refreshToken": "token",
                "status": 1,
                "data": {"token": "test-token"}
              }),
              200);
        });
        final model = UserRepository();
        model.client = mockClient;
        final result = await model.refreshToken();
        expect(result, true);
      },
    );

    test(
      "updateToken tests",
      () async {
        final model = UserRepository();
        model.updateToken('test-token');
        expect(model.currentUser?.token, isNull);
      },
    );

    testWidgets(
      "logout",
      (WidgetTester tester) async {
        Widget widget = testingMaterial(initialLocation: DashboardScreen.path);
        await tester.pumpWidget(widget);
        BuildContext context = NavigationService.context!;
        model.signOutUser(context);
        await tester.pumpAndSettle();
        await tester.tap(find.byKey(const Key("function")));
        model.directLogOut(context);
      },
    );
  });
}
