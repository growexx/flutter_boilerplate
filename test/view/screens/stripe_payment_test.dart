import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/view/screens/screens.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../util/common_initial_activity.dart';
import '../../util/testing_material_app.dart';

void main() async {
  await commonInitialActivity();
  Widget widget = testingMaterial(initialLocation: StripePaymentScreen.path);
  testWidgets(
    "button test",
    (WidgetTester tester) async {
      await tester.pumpWidget(widget);
      expect(find.byType(ElevatedButton), findsOneWidget);
      await tester.tap(find.byType(ElevatedButton));
    },
  );
}
