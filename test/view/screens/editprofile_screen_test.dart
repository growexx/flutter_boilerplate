import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/view/screens/edit_profile/editprofile_screen.dart';
import 'package:flutter_test/flutter_test.dart';
import '../../util/common_initial_activity.dart';
import '../../util/testing_material_app.dart';

void main() async {
  await commonInitialActivity();
  TestWidgetsFlutterBinding.ensureInitialized();

  group("Edit Profile Screen Test", () {
    testWidgets('edit-profile screen Test', (WidgetTester tester) async {
      Widget widget = testingMaterial(initialLocation: EditProfileScreen.path);
      await tester.pumpWidget(widget);
      expect(find.byKey(const Key("editprofile")), findsOneWidget);
      expect(find.byKey(const Key("tf_first_name")), findsOneWidget);
      expect(find.byKey(const Key("tf_last_name")), findsOneWidget);
      expect(find.byKey(const Key("tf_email_address")), findsOneWidget);
      expect(find.byKey(const Key("tf_mobile_number")), findsOneWidget);
      expect(find.byKey(const Key("tb_editprofile")), findsOneWidget);

      await tester.pumpAndSettle(const Duration(seconds: 2));
      await tester.pumpAndSettle();

      await tester.enterText(find.byKey(const Key("tf_first_name")), 'Jaimin');
      await tester.testTextInput.receiveAction(TextInputAction.done);
      await tester.enterText(find.byKey(const Key("tf_last_name")), 'Modi');
      await tester.testTextInput.receiveAction(TextInputAction.done);
      await tester.enterText(
          find.byKey(const Key("tf_email_address")), 'test@gmail.com');
      await tester.testTextInput.receiveAction(TextInputAction.done);
      await tester.enterText(
          find.byKey(const Key("tf_mobile_number")), '9999900000');
      await tester.testTextInput.receiveAction(TextInputAction.done);
      

      //Edit Profile button Tap
      final Finder editButton = find.byKey(const Key("tb_editprofile"));
      await tester.tap(editButton, warnIfMissed: false);
      await tester.pumpAndSettle(const Duration(seconds: 2));
      await tester.pumpAndSettle();
    });

    testWidgets(
      "Edit Profile widget tests",
      (WidgetTester tester) async {
        Widget widget =
            testingMaterial(initialLocation: EditProfileScreen.path);
        await tester.pumpWidget(widget);
        await tester.tap(find.byKey(const Key('pick_image_gesture_detector')));
      },
    );


    testWidgets(
      "to Dashboard",
          (WidgetTester tester) async {
        Widget widget =
        testingMaterial(initialLocation: EditProfileScreen.path);
        await tester.pumpWidget(widget);
        await tester.tap(find.byType(IconButton));
        await tester.pump(const Duration(seconds: 3));

        final dynamic widgetsAppState = tester.state(find.byType(WidgetsApp));
        await widgetsAppState.didPopRoute();
        await tester.pump();
      },
    );
  });
}
