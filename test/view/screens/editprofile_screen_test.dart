import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/view/screens/edit_profile/editprofile_screen.dart';
import 'package:flutter_test/flutter_test.dart';
import '../../util/common_initial_activity.dart';
import '../../util/testing_material_app.dart';

void main() async {
  await commonInitialActivity();
  TestWidgetsFlutterBinding.ensureInitialized();

  group("SignUp Screen Test", () {
    testWidgets('sign-up screen', (WidgetTester tester) async {
      Widget widget = testingMaterial(initialLocation: EditProfileScreen.path);
      await tester.pumpWidget(widget);
      expect(find.byKey(const Key("editprofile")), findsOneWidget);
      expect(find.byKey(const Key("tf_first_name")), findsOneWidget);
      expect(find.byKey(const Key("tf_last_name")), findsOneWidget);
      expect(find.byKey(const Key("tf_email_address")), findsOneWidget);
      expect(find.byKey(const Key("tb_editprofile")), findsOneWidget);

      await tester.pumpAndSettle(const Duration(seconds: 2));
      await tester.pumpAndSettle();

      await tester.enterText(find.byKey(const Key("tf_first_name")), 'Jaimin');
      await tester.testTextInput.receiveAction(TextInputAction.done);
      await tester.enterText(find.byKey(const Key("tf_last_name")), 'Modi');
      await tester.testTextInput.receiveAction(TextInputAction.done);
      await tester.enterText(find.byKey(const Key("tf_email_address")), 'test@gmail.com');
      await tester.testTextInput.receiveAction(TextInputAction.done);
      await tester.testTextInput.receiveAction(TextInputAction.done);

      //Sign up button Tap
      final Finder editButton = find.byKey(const Key("tb_editprofile"));
      await tester.tap(editButton, warnIfMissed: false);
      await tester.pumpAndSettle(const Duration(seconds: 2));
      await tester.pumpAndSettle();
      //expect(find.text("This is a mandatory field"),findsNWidgets(2));

    });
  });
}
