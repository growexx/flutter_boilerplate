import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/go_router/error_screen.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../util/testing_material_app.dart';

void main() {
  testWidgets(
    "errortesting",
    (WidgetTester tester) async {
      await tester.pumpWidget(testingMaterial(initialLocation: "/test"));
      expect(find.byType(ErrorScreen), findsOneWidget);
      expect(find.text('Return to home'), findsOneWidget);

      await tester.tap(find.byType(TextButton));
      await tester.pumpAndSettle(const Duration(seconds: 2));
    },
  );
}
