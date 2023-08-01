import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/view/screens/pin_support/widget/security_pin_screen.dart';
import 'package:flutter_test/flutter_test.dart';
import '../../util/common_initial_activity.dart';
import '../../util/testing_material_app.dart';

void main() async {
  await commonInitialActivity();
  TestWidgetsFlutterBinding.ensureInitialized();

  group("Security PIN Screen Test", () {
    testWidgets('Security PIN Screen Test', (WidgetTester tester) async {
      Widget widget = testingMaterial(initialLocation: SecurityPinScreen.path);
      await tester.pumpWidget(widget);
      expect(find.byKey(const Key("sf_widget")), findsOneWidget);
      expect(find.byKey(const Key("row")), findsOneWidget);
      expect(find.byKey(const Key("welcome")), findsOneWidget);
      expect(find.byKey(const Key("welcome_widget")), findsOneWidget);
      expect(find.byKey(const Key("filedPart")), findsOneWidget);
    });
  });
}
