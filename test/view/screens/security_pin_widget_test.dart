import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/view/screens/pin_support/widget/security_pin_filed_widget.dart';
import 'package:flutter_test/flutter_test.dart';
import '../../util/common_initial_activity.dart';

void main() async {
  await commonInitialActivity();
  TestWidgetsFlutterBinding.ensureInitialized();

  group("Pin Support Widget Test", () {
    testWidgets('Security Pin Widget', (WidgetTester tester) async {
      Widget widget = const MaterialApp(home: SecurityPinFieldWidget());
      await tester.pumpWidget(widget);

      final Finder verify = find.byKey(const Key("verify_pin"));
      expect(verify, findsOneWidget);
      await tester.tap(verify, warnIfMissed: false);

      await tester.pumpAndSettle(const Duration(seconds: 2));
      await tester.pumpAndSettle();
    });
  });
}
