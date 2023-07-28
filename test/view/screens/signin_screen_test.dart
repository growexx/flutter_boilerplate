import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/view/screens/signin/signin_screen.dart';
import 'package:flutter_test/flutter_test.dart';
import '../../util/common_initial_activity.dart';
import '../../util/testing_material_app.dart';

void main() async {
  await commonInitialActivity();
  TestWidgetsFlutterBinding.ensureInitialized();

  group("SignIn Screen Test", () {
    testWidgets('sign-in screen', (WidgetTester tester) async {
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

      //Google button Tap
      final Finder googleButton = find.byKey(const Key("google"));
      await tester.tap(googleButton, warnIfMissed: false);
      await tester.pumpAndSettle(const Duration(seconds: 2));
      await tester.pumpAndSettle();

      //facebook button Tap
      final Finder facebookButton = find.byKey(const Key("google"));
      await tester.tap(facebookButton, warnIfMissed: false);
      await tester.pumpAndSettle(const Duration(seconds: 2));
      await tester.pumpAndSettle();

      //twitter button Tap
      final Finder twitterButton = find.byKey(const Key("google"));
      await tester.tap(twitterButton, warnIfMissed: false);
      await tester.pumpAndSettle(const Duration(seconds: 2));
      await tester.pumpAndSettle();

      //instagram button Tap
      final Finder instagramButton = find.byKey(const Key("google"));
      await tester.tap(instagramButton, warnIfMissed: false);
      await tester.pumpAndSettle(const Duration(seconds: 2));
      await tester.pumpAndSettle();

      //apple button Tap
      final Finder appleButton = find.byKey(const Key("google"));
      await tester.tap(appleButton, warnIfMissed: false);
      await tester.pumpAndSettle(const Duration(seconds: 2));
      await tester.pumpAndSettle();

      //expect(find.text("This is a mandatory field"),findsNWidgets(2));

    });
  });
}
