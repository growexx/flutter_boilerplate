import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/view/screens/otp/otp_screen.dart';
import 'package:flutter_test/flutter_test.dart';
import '../../util/common_initial_activity.dart';
import '../../util/testing_material_app.dart';

void main() async {
  await commonInitialActivity();
  TestWidgetsFlutterBinding.ensureInitialized();

  group("OTP Screen Test", () {
    testWidgets('otp verification screen', (WidgetTester tester) async {
      Widget widget = testingMaterial(initialLocation: OTPScreen.path);
      await tester.pumpWidget(widget);

      expect(find.byKey(const Key("send_otp")), findsOneWidget);
      expect(find.byKey(const Key("add_your_phone_number")), findsOneWidget);
      expect(find.byKey(const Key("phone")), findsOneWidget);
      expect(find.byKey(const Key("send")), findsOneWidget);

      await tester.pumpAndSettle(const Duration(seconds: 2));
      await tester.pumpAndSettle();

      await tester.enterText(find.byKey(const Key("phone")), '9408776491');
      await tester.testTextInput.receiveAction(TextInputAction.done);

      //OTP button Tap
      final Finder sendButton = find.byKey(const Key("send"));
      await tester.tap(sendButton, warnIfMissed: false);
      await tester.pumpAndSettle(const Duration(seconds: 2));
      await tester.pumpAndSettle();

      expect(find.byKey(const Key("verification")), findsOneWidget);
      expect(find.byKey(const Key("enter_otp")), findsOneWidget);
      expect(find.byKey(const Key("otp_text_field_container")), findsOneWidget);

      final Finder otpField = find.byKey(const Key("otp_text_field"));
      expect(otpField, findsNWidgets(4));
      await tester.enterText(otpField, '1');
      await tester.testTextInput.receiveAction(TextInputAction.done);

      expect(find.byKey(const Key("verify")), findsOneWidget);
      expect(find.byKey(const Key("did_not_receive_code")), findsOneWidget);

      final Finder reSendButton = find.byKey(const Key("resend_new_code"));
      expect(reSendButton, findsOneWidget);

      //Re-send button Tap
      await tester.tap(reSendButton, warnIfMissed: false);
      await tester.pumpAndSettle(const Duration(seconds: 2));
      await tester.pumpAndSettle();
    });
  });
}
