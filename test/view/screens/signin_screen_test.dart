import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/view/screens/signin/signin_screen.dart';
import 'package:flutter_test/flutter_test.dart';
import '../../util/common_initial_activity.dart';
import '../../util/testing_material_app.dart';

void main() async {
  await commonInitialActivity();
  TestWidgetsFlutterBinding.ensureInitialized();

  group("SignIn Screen Test", () {
    testWidgets('sign-in screen : Find Widgets & Tap on SignIn  button', (WidgetTester tester) async {
      Widget widget = testingMaterial(initialLocation: SignInScreen.path);
      await tester.pumpWidget(widget);
      expect(find.byKey(const Key("sign_in")), findsOneWidget);
      expect(find.byKey(const Key("sign_in_description")), findsOneWidget);
      expect(find.byKey(const Key("social_container")), findsOneWidget);
      expect(find.byKey(const Key("facebook")), findsOneWidget);
      expect(find.byKey(const Key("instagram")), findsOneWidget);
      expect(find.byKey(const Key("google")), findsOneWidget);
      expect(find.byKey(const Key("twitter")), findsOneWidget);
      expect(find.byKey(const Key("apple")), findsOneWidget);
      expect(find.text("OR"), findsOneWidget);
      expect(find.byKey(const Key("tf_email")), findsOneWidget);
      expect(find.byKey(const Key("tf_password")), findsOneWidget);
      expect(find.byKey(const Key("tb_sign_in")), findsOneWidget);
      expect(find.byKey(const Key("cb_remember_me")), findsOneWidget);
      expect(find.byKey(const Key("t_remember_me")), findsOneWidget);
      expect(find.byKey(const Key("t_forgot_password")), findsOneWidget);
      expect(find.byKey(const Key("t_sign_up_description")), findsOneWidget);
      expect(find.byKey(const Key("t_sign_up")), findsOneWidget);
      expect(find.byKey(const Key("tb_sign_in_with_otp")), findsOneWidget);

      await tester.pumpAndSettle(const Duration(seconds: 2));
      await tester.pumpAndSettle();

      await tester.enterText(find.byKey(const Key("tf_email")), 'test@gmail.com');
      await tester.testTextInput.receiveAction(TextInputAction.done);
      await tester.enterText(find.byKey(const Key("tf_password")), 'Test@123');
      await tester.testTextInput.receiveAction(TextInputAction.done);

      //Sign in button Tap
      final Finder signInButton = find.byKey(const Key("tb_sign_in"));
      await tester.tap(signInButton, warnIfMissed: false);
      await tester.pumpAndSettle(const Duration(seconds: 2));
      await tester.pumpAndSettle();
    });
    testWidgets('sign-in screen : Tap on "Sign In With OTP" button', (WidgetTester tester) async {
      Widget widget = testingMaterial(initialLocation: SignInScreen.path);
      await tester.pumpWidget(widget);
      expect(find.byKey(const Key("sign_in")), findsOneWidget);
      expect(find.byKey(const Key("sign_in_description")), findsOneWidget);
      expect(find.byKey(const Key("social_container")), findsOneWidget);
      expect(find.byKey(const Key("facebook")), findsOneWidget);
      expect(find.byKey(const Key("instagram")), findsOneWidget);
      expect(find.byKey(const Key("google")), findsOneWidget);
      expect(find.byKey(const Key("twitter")), findsOneWidget);
      expect(find.byKey(const Key("apple")), findsOneWidget);
      expect(find.text("OR"), findsOneWidget);
      expect(find.byKey(const Key("tf_email")), findsOneWidget);
      expect(find.byKey(const Key("tf_password")), findsOneWidget);
      expect(find.byKey(const Key("tb_sign_in")), findsOneWidget);
      expect(find.byKey(const Key("cb_remember_me")), findsOneWidget);
      expect(find.byKey(const Key("t_remember_me")), findsOneWidget);
      expect(find.byKey(const Key("t_forgot_password")), findsOneWidget);
      expect(find.byKey(const Key("t_sign_up_description")), findsOneWidget);
      expect(find.byKey(const Key("t_sign_up")), findsOneWidget);
      expect(find.byKey(const Key("tb_sign_in_with_otp")), findsOneWidget);

      //Sign in with OTP
      final Finder signWithOTP = find.byKey(const Key("tb_sign_in_with_otp"));
      await tester.tap(signWithOTP, warnIfMissed: false);
      await tester.pumpAndSettle(const Duration(seconds: 2));
      await tester.pumpAndSettle();
    });
    testWidgets('sign-in screen : Find Widgets & Tap on Google Login button', (WidgetTester tester) async {
      Widget widget = testingMaterial(initialLocation: SignInScreen.path);
      await tester.pumpWidget(widget);
      expect(find.byKey(const Key("sign_in")), findsOneWidget);
      expect(find.byKey(const Key("sign_in_description")), findsOneWidget);
      expect(find.byKey(const Key("social_container")), findsOneWidget);
      expect(find.byKey(const Key("facebook")), findsOneWidget);
      expect(find.byKey(const Key("instagram")), findsOneWidget);
      expect(find.byKey(const Key("google")), findsOneWidget);
      expect(find.byKey(const Key("twitter")), findsOneWidget);
      expect(find.byKey(const Key("apple")), findsOneWidget);
      expect(find.text("OR"), findsOneWidget);
      expect(find.byKey(const Key("tf_email")), findsOneWidget);
      expect(find.byKey(const Key("tf_password")), findsOneWidget);
      expect(find.byKey(const Key("tb_sign_in")), findsOneWidget);
      expect(find.byKey(const Key("cb_remember_me")), findsOneWidget);
      expect(find.byKey(const Key("t_remember_me")), findsOneWidget);
      expect(find.byKey(const Key("t_forgot_password")), findsOneWidget);
      expect(find.byKey(const Key("t_sign_up_description")), findsOneWidget);
      expect(find.byKey(const Key("t_sign_up")), findsOneWidget);
      expect(find.byKey(const Key("tb_sign_in_with_otp")), findsOneWidget);

      await tester.pumpAndSettle(const Duration(seconds: 2));
      await tester.pumpAndSettle();

      await tester.enterText(find.byKey(const Key("tf_email")), 'test@gmail.com');
      await tester.testTextInput.receiveAction(TextInputAction.done);
      await tester.enterText(find.byKey(const Key("tf_password")), 'Test@123');
      await tester.testTextInput.receiveAction(TextInputAction.done);

      //Google button Tap
      final Finder googleButton = find.byKey(const Key("google"));
      await tester.tap(googleButton, warnIfMissed: false);
      await tester.pumpAndSettle(const Duration(seconds: 2));
      await tester.pumpAndSettle();
    });
    testWidgets('sign-in screen : Find Widgets & Tap on Facebook Login button', (WidgetTester tester) async {
      Widget widget = testingMaterial(initialLocation: SignInScreen.path);
      await tester.pumpWidget(widget);
      expect(find.byKey(const Key("sign_in")), findsOneWidget);
      expect(find.byKey(const Key("sign_in_description")), findsOneWidget);
      expect(find.byKey(const Key("social_container")), findsOneWidget);
      expect(find.byKey(const Key("facebook")), findsOneWidget);
      expect(find.byKey(const Key("instagram")), findsOneWidget);
      expect(find.byKey(const Key("google")), findsOneWidget);
      expect(find.byKey(const Key("twitter")), findsOneWidget);
      expect(find.byKey(const Key("apple")), findsOneWidget);
      expect(find.text("OR"), findsOneWidget);
      expect(find.byKey(const Key("tf_email")), findsOneWidget);
      expect(find.byKey(const Key("tf_password")), findsOneWidget);
      expect(find.byKey(const Key("tb_sign_in")), findsOneWidget);
      expect(find.byKey(const Key("cb_remember_me")), findsOneWidget);
      expect(find.byKey(const Key("t_remember_me")), findsOneWidget);
      expect(find.byKey(const Key("t_forgot_password")), findsOneWidget);
      expect(find.byKey(const Key("t_sign_up_description")), findsOneWidget);
      expect(find.byKey(const Key("t_sign_up")), findsOneWidget);
      expect(find.byKey(const Key("tb_sign_in_with_otp")), findsOneWidget);

      await tester.pumpAndSettle(const Duration(seconds: 2));
      await tester.pumpAndSettle();

      await tester.enterText(find.byKey(const Key("tf_email")), 'test@gmail.com');
      await tester.testTextInput.receiveAction(TextInputAction.done);
      await tester.enterText(find.byKey(const Key("tf_password")), 'Test@123');
      await tester.testTextInput.receiveAction(TextInputAction.done);

      //Facebook button Tap
      final Finder facebookButton = find.byKey(const Key("facebook"));
      await tester.tap(facebookButton, warnIfMissed: false);
      await tester.pumpAndSettle(const Duration(seconds: 2));
      await tester.pumpAndSettle();
    });
    testWidgets('sign-in screen : Find Widgets & Tap on Instagram Login button', (WidgetTester tester) async {
      Widget widget = testingMaterial(initialLocation: SignInScreen.path);
      await tester.pumpWidget(widget);
      expect(find.byKey(const Key("sign_in")), findsOneWidget);
      expect(find.byKey(const Key("sign_in_description")), findsOneWidget);
      expect(find.byKey(const Key("social_container")), findsOneWidget);
      expect(find.byKey(const Key("facebook")), findsOneWidget);
      expect(find.byKey(const Key("instagram")), findsOneWidget);
      expect(find.byKey(const Key("google")), findsOneWidget);
      expect(find.byKey(const Key("twitter")), findsOneWidget);
      expect(find.byKey(const Key("apple")), findsOneWidget);
      expect(find.text("OR"), findsOneWidget);
      expect(find.byKey(const Key("tf_email")), findsOneWidget);
      expect(find.byKey(const Key("tf_password")), findsOneWidget);
      expect(find.byKey(const Key("tb_sign_in")), findsOneWidget);
      expect(find.byKey(const Key("cb_remember_me")), findsOneWidget);
      expect(find.byKey(const Key("t_remember_me")), findsOneWidget);
      expect(find.byKey(const Key("t_forgot_password")), findsOneWidget);
      expect(find.byKey(const Key("t_sign_up_description")), findsOneWidget);
      expect(find.byKey(const Key("t_sign_up")), findsOneWidget);
      expect(find.byKey(const Key("tb_sign_in_with_otp")), findsOneWidget);

      await tester.pumpAndSettle(const Duration(seconds: 2));
      await tester.pumpAndSettle();

      await tester.enterText(find.byKey(const Key("tf_email")), 'test@gmail.com');
      await tester.testTextInput.receiveAction(TextInputAction.done);
      await tester.enterText(find.byKey(const Key("tf_password")), 'Test@123');
      await tester.testTextInput.receiveAction(TextInputAction.done);

      //Instagram button Tap
      final Finder instagramButton = find.byKey(const Key("instagram"));
      await tester.tap(instagramButton, warnIfMissed: false);
      await tester.pumpAndSettle(const Duration(seconds: 2));
      await tester.pumpAndSettle();
    });
    testWidgets('sign-in screen : Find Widgets & Tap on Twitter Login button', (WidgetTester tester) async {
      Widget widget = testingMaterial(initialLocation: SignInScreen.path);
      await tester.pumpWidget(widget);
      expect(find.byKey(const Key("sign_in")), findsOneWidget);
      expect(find.byKey(const Key("sign_in_description")), findsOneWidget);
      expect(find.byKey(const Key("social_container")), findsOneWidget);
      expect(find.byKey(const Key("facebook")), findsOneWidget);
      expect(find.byKey(const Key("instagram")), findsOneWidget);
      expect(find.byKey(const Key("google")), findsOneWidget);
      expect(find.byKey(const Key("twitter")), findsOneWidget);
      expect(find.byKey(const Key("apple")), findsOneWidget);
      expect(find.text("OR"), findsOneWidget);
      expect(find.byKey(const Key("tf_email")), findsOneWidget);
      expect(find.byKey(const Key("tf_password")), findsOneWidget);
      expect(find.byKey(const Key("tb_sign_in")), findsOneWidget);
      expect(find.byKey(const Key("cb_remember_me")), findsOneWidget);
      expect(find.byKey(const Key("t_remember_me")), findsOneWidget);
      expect(find.byKey(const Key("t_forgot_password")), findsOneWidget);
      expect(find.byKey(const Key("t_sign_up_description")), findsOneWidget);
      expect(find.byKey(const Key("t_sign_up")), findsOneWidget);
      expect(find.byKey(const Key("tb_sign_in_with_otp")), findsOneWidget);

      await tester.pumpAndSettle(const Duration(seconds: 2));
      await tester.pumpAndSettle();

      await tester.enterText(find.byKey(const Key("tf_email")), 'test@gmail.com');
      await tester.testTextInput.receiveAction(TextInputAction.done);
      await tester.enterText(find.byKey(const Key("tf_password")), 'Test@123');
      await tester.testTextInput.receiveAction(TextInputAction.done);

      //Google button Tap
      final Finder twitterButton = find.byKey(const Key("twitter"));
      await tester.tap(twitterButton, warnIfMissed: false);
      await tester.pumpAndSettle(const Duration(seconds: 2));
      await tester.pumpAndSettle();
    });
  });
}
