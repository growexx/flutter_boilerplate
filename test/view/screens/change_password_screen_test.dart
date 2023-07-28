import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/view/screens/change_password/change_password_screen.dart';
import 'package:flutter_boilerplate/view/screens/signin/signin_screen.dart';
import 'package:flutter_boilerplate/view/screens/signup/signup_screen.dart';
import 'package:flutter_test/flutter_test.dart';
import '../../util/common_initial_activity.dart';
import '../../util/testing_material_app.dart';

void main() async {
  await commonInitialActivity();
  TestWidgetsFlutterBinding.ensureInitialized();

  group("Change Password Screen Test", () {
    testWidgets('change password screen', (WidgetTester tester) async {
      Widget widget = testingMaterial(initialLocation: ChangePasswordScreen.path);
      await tester.pumpWidget(widget);
      expect(find.byKey(const Key("title_change_password")), findsOneWidget);
      expect(find.byKey(const Key("tf_old_password")), findsOneWidget);
      expect(find.byKey(const Key("tf_new_password")), findsOneWidget);
      expect(find.byKey(const Key("tf_confirm_new_password")), findsOneWidget);
      expect(find.byKey(const Key("tb_change_password")), findsOneWidget);
      expect(find.byKey(const Key("size_one")), findsOneWidget);
      expect(find.byKey(const Key("size_two")), findsOneWidget);
      expect(find.byKey(const Key("size_three")), findsOneWidget);
      expect(find.byKey(const Key("size_four")), findsOneWidget);

      await tester.pumpAndSettle(const Duration(seconds: 2));
      await tester.pumpAndSettle();

      await tester.enterText(find.byKey(const Key("tf_old_password")), 'Test@123');
      await tester.testTextInput.receiveAction(TextInputAction.done);
      await tester.enterText(find.byKey(const Key("tf_new_password")), 'Test@1234');
      await tester.testTextInput.receiveAction(TextInputAction.done);
      await tester.enterText(find.byKey(const Key("tf_confirm_new_password")), 'Test@1234');
      await tester.testTextInput.receiveAction(TextInputAction.done);

      //Sign up button Tap
      final Finder signUpButton = find.byKey(const Key("tb_change_password"));
      await tester.tap(signUpButton, warnIfMissed: false);
      await tester.pumpAndSettle(const Duration(seconds: 2));
      await tester.pumpAndSettle();
      //expect(find.text("This is a mandatory field"),findsNWidgets(2));

    });
  });
}
