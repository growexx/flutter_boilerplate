import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/view/screens/pin_support/widget/security_pin_filed_widget.dart';
import 'package:flutter_boilerplate/view_model/security_pin_view_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import '../../util/common_initial_activity.dart';

void main() async {
  await commonInitialActivity();
  TestWidgetsFlutterBinding.ensureInitialized();

  group("Pin Support Widget Test", () {
    testWidgets('Security Pin Widget', (WidgetTester tester) async {
      Widget widget = MultiProvider(
          providers: [
            ChangeNotifierProvider<SecurityPinViewModel>(
              create: (_) => SecurityPinViewModel(),
            ),
          ],
          child: const MaterialApp(
            home: SecurityPinFieldWidget(),
          ));
      await tester.pumpWidget(widget);

      final Finder verify = find.byKey(const Key("verify_pin"));
      expect(verify, findsOneWidget);
      await tester.tap(verify, warnIfMissed: false);

      await tester.pumpAndSettle(const Duration(seconds: 2));
      await tester.pumpAndSettle();
    });
    testWidgets('Security Pin Widget for create pin',
        (WidgetTester tester) async {
      Widget widget = MultiProvider(
          providers: [
            ChangeNotifierProvider<SecurityPinViewModel>(
              create: (_) => SecurityPinViewModel(),
            ),
          ],
          child: const MaterialApp(
            home: SecurityPinFieldWidget(),
          ));
      await tester.pumpWidget(widget);

      final Finder pin = find.byKey(const Key("create_pin"));
      expect(pin, findsOneWidget);
      await tester.tap(pin, warnIfMissed: false);

      await tester.pumpAndSettle(const Duration(seconds: 2));
      await tester.pumpAndSettle();
    });
  });
}
