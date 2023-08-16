import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/view/screens/components/circular_indicator_white.dart';
import 'package:flutter_boilerplate/view/screens/components/loader_button.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('LoaderButton', () {
    testWidgets('Initial state', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          body: LoaderButton(
            label: 'Submit',
            onPressed: () {},
          ),
        ),
      ));

      // Verify the initial state
      expect(find.text('Submit'), findsOneWidget);
      expect(find.byType(CircularIndicatorWhite), findsNothing);
      expect(
          tester.widget<TextButton>(find.byType(TextButton)).enabled, isTrue);
      expect(find.byType(Center), findsOneWidget);
    });

    // Add more test cases to cover other scenarios
  });

  group('LoaderButtonWithIcon', () {
    testWidgets('Initial state', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          body: LoaderButtonWithIcon(
            label: 'Submit',
            onPressed: () {},
            icon: const Icon(Icons.check),
          ),
        ),
      ));

      // Verify the initial state
      expect(find.text('Submit'), findsOneWidget);
      expect(find.byType(CircularIndicatorWhite), findsNothing);
      expect(find.byIcon(Icons.check), findsOneWidget);
      await tester.tap(find.byIcon(Icons.check));
    });
    group('LoaderButtonWithIcon', () {
      testWidgets('loader state', (WidgetTester tester) async {
        await tester.pumpWidget(MaterialApp(
          home: Scaffold(
            body: LoaderButtonWithIcon(
              loading: true,
              label: 'Submit',
              onPressed: () {},
              icon: const Icon(Icons.check),
            ),
          ),
        ));

        // Verify the initial state
        // expect(find.text('Submit'), findsOneWidget);
        expect(find.byType(CircularIndicatorWhite), findsOneWidget);
        expect(find.byType(Icon), findsOneWidget);
      });

      // Add more test cases to cover other scenarios
    });
    testWidgets('loading', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          body: LoaderButton(
            loading: true,
            label: 'Submit',
            onPressed: () {},
          ),
        ),
      ));
      expect(find.byType(CircularIndicatorWhite), findsOneWidget);
      expect(
          tester.widget<TextButton>(find.byType(TextButton)).enabled, isTrue);
      expect(find.byType(Center), findsOneWidget);
    });
  });
}
