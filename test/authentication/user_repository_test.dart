import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/app_manager/service/navigation_service.dart';
import 'package:flutter_boilerplate/authentication/user.dart';
import 'package:flutter_boilerplate/authentication/user_repository.dart';
import 'package:flutter_boilerplate/view/screens/dashboard/dashboard_screen.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../util/common_initial_activity.dart';
import '../util/router_testing.dart';



void main() async{
  TestWidgetsFlutterBinding.ensureInitialized();
  late UserRepository model;
  await commonInitialActivity();
  setUpAll(() async{
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

    testWidgets(
      "logout",
          (WidgetTester tester) async {
            Widget widget =        ChangeNotifierProvider<UserRepository>(
              create: (_) => UserRepository(
                currentUser: User(id: "test_id")
              ),
              child: MaterialApp.router(
                  routerConfig: routerTesting(
                      initialLocation: DashboardScreen.path
                  )
              ),
            );
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
