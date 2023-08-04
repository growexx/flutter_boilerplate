import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/view/screens/signup/signup_screen.dart';
import 'package:flutter_test/flutter_test.dart';
import '../../util/common_initial_activity.dart';
import '../../util/testing_material_app.dart';

void main() async {
  await commonInitialActivity();
  TestWidgetsFlutterBinding.ensureInitialized();

  group("SignUp Screen Test", () {
    testWidgets('sign-up screen', (WidgetTester tester) async {
      Widget widget = testingMaterial(initialLocation: SignUpScreen.path);
      await tester.pumpWidget(widget);

      expect(find.byKey(const Key("sign_up")), findsOneWidget);
      expect(find.byKey(const Key("tf_first_name")), findsOneWidget);
      expect(find.byKey(const Key("tf_last_name")), findsOneWidget);
      expect(find.byKey(const Key("tf_email_address")), findsOneWidget);
      expect(find.byKey(const Key("tf_password")), findsOneWidget);
      expect(find.byKey(const Key("tf_confirm_password")), findsOneWidget);
      expect(find.byKey(const Key("tb_sign_up")), findsOneWidget);
      expect(find.byKey(const Key("t_sign_up_description")), findsOneWidget);
      expect(find.byKey(const Key("t_sign_in")), findsOneWidget);
      expect(find.byKey(const Key("pick_image_gesture_detector")), findsOneWidget);
      expect(find.byKey(const Key("pick_image_text")), findsOneWidget);

      final Finder pickImageButton = find.byKey(const Key("circle_avatar_picked_image"));
      expect(pickImageButton, findsNothing);
     // await tester.tap(pickImageButton, warnIfMissed: false);



      await tester.pumpAndSettle(const Duration(seconds: 2));
      await tester.pumpAndSettle();

      await tester.enterText(find.byKey(const Key("tf_first_name")), 'Jaimin');
      await tester.testTextInput.receiveAction(TextInputAction.done);
      await tester.enterText(find.byKey(const Key("tf_last_name")), 'Modi');
      await tester.testTextInput.receiveAction(TextInputAction.done);
      await tester.enterText(find.byKey(const Key("tf_email_address")), 'test@gmail.com');
      await tester.testTextInput.receiveAction(TextInputAction.done);
      await tester.enterText(find.byKey(const Key("tf_password")), 'Test@123');
      await tester.testTextInput.receiveAction(TextInputAction.done);
      await tester.enterText(find.byKey(const Key("tf_confirm_password")), 'Test@123');
      await tester.testTextInput.receiveAction(TextInputAction.done);

      //Sign up button Tap
      final Finder signUpButton = find.byKey(const Key("tb_sign_up"));
      await tester.tap(signUpButton, warnIfMissed: false);
      await tester.pumpAndSettle(const Duration(seconds: 2));
      await tester.pumpAndSettle();
      //expect(find.text("This is a mandatory field"),findsNWidgets(2));

    });
  });
}
