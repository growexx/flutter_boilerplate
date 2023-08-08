import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/util/show_exit_pop_up.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart'; // For mocking dependencies

// Import your function and any necessary classes
import 'package:flutter_boilerplate/app_manager/component/bottom_sheet/custom_bottom_sheet.dart';

// Mock class for CustomBottomSheet
class MockCustomBottomSheet extends Mock implements CustomBottomSheet {}

void main() {
  group('Exit Popup Function', () {
    testWidgets('Exit popup is shown correctly and exit function is called', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Builder(
            builder: (context) {
              return ElevatedButton(
                onPressed: () {
                  showExitPopUp(context);
                },
                child: const Text('Show Exit Popup'),
              );
            },
          ),
        ),
      );

      await tester.tap(find.text('Show Exit Popup'));
      await tester.pumpAndSettle();
      final exitButton = find.text("CANCEL");
      expect(exitButton, findsOneWidget);
      await tester.tap(exitButton);
      await tester.pumpAndSettle();

    });

  });
}
