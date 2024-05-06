import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/view/screens/forgot_password/forgot_password_screen.dart';
import 'package:flutter_test/flutter_test.dart';
import '../../util/common_initial_activity.dart';
import '../../util/testing_material_app.dart';

void main() async {
  await commonInitialActivity();
  TestWidgetsFlutterBinding.ensureInitialized();

  group("Forgot Password Screen Test", () {
    testWidgets('forgot password screen', (WidgetTester tester) async {
      Widget widget = testingMaterial(initialLocation: ForgotPasswordScreen.path);
      await tester.pumpWidget(widget);
      expect(find.byKey(const Key("title_forgot_password")), findsOneWidget);
      expect(find.byKey(const Key("t_forgot_password_description")), findsOneWidget);
      expect(find.byKey(const Key("tf_email_address")), findsOneWidget);
      expect(find.byKey(const Key("tb_reset_link")), findsOneWidget);
      final Finder resetLinkButton = find.byKey(const Key("tb_reset_link"));
      final Finder backToLoginButton = find.byKey(const Key("iw_back_to_login"));
      expect(resetLinkButton, findsOneWidget);
      expect(backToLoginButton, findsOneWidget);

      await tester.pumpAndSettle(const Duration(seconds: 2));
      await tester.pumpAndSettle();

      await tester.enterText(
          find.byKey(const Key("tf_email_address")), 'testgmail.com');
      await tester.tap(resetLinkButton, warnIfMissed: false);
      await tester.pumpAndSettle(const Duration(seconds: 2));
      await tester.pumpAndSettle();

      await tester.enterText(find.byKey(const Key("tf_email_address")), 'test@gmail.com');
      await tester.testTextInput.receiveAction(TextInputAction.done);

      //Reset Link button Tap
      await tester.tap(resetLinkButton, warnIfMissed: false);
      await tester.pumpAndSettle(const Duration(seconds: 2));
      await tester.pumpAndSettle();

      //Back to Login button Tap
      await tester.tap(backToLoginButton, warnIfMissed: false);
      await tester.pumpAndSettle(const Duration(seconds: 2));
      await tester.pumpAndSettle();
    });


    testWidgets('to signin', (WidgetTester tester) async {
      Widget widget = testingMaterial(initialLocation: ForgotPasswordScreen.path);
      await tester.pumpWidget(widget);

      final Finder toSignIn = find.byKey(const Key('to_signin'));
      await tester.tap(toSignIn);
      await tester.pumpAndSettle(const Duration(seconds: 2));
      await tester.pumpAndSettle();
    });
  });
}
