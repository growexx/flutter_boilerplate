import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/view/screens/components/circular_indicator_white.dart';
import 'package:flutter_test/flutter_test.dart';


void main() {
  group('CircularIndicatorWhite', () {
    testWidgets('Verify appearance and dimensions',
        (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(
        home: Scaffold(
          body: Center(
            child: CircularIndicatorWhite(),
          ),
        ),
      ));

      final circularProgressFinder =
          find.byType(CircularProgressIndicator);
      expect(circularProgressFinder, findsOneWidget);

      final circularProgressWidget =
          tester.widget<CircularProgressIndicator>(circularProgressFinder);
      expect(circularProgressWidget.color, equals(Colors.white));

      final sizedBoxFinder = find.byType(SizedBox);
      expect(sizedBoxFinder, findsOneWidget);

      final sizedBoxWidget = tester.widget<SizedBox>(sizedBoxFinder);
      expect(sizedBoxWidget.height, equals(20));
      expect(sizedBoxWidget.width, equals(20));
    });
  });
}
