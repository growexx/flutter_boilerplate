import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/app_manager/component/alert_dialog/alert_dialog_view.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('AlertDialogView renders without error',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: AlertDialogView(
          title: 'Test Title',
          message: 'Test Message',
          popButtonTitle: 'Cancel',
          successButtonTitle: 'Confirm',
          onPressFunction: () {},
        ),
      ),
    );

    expect(find.byType(AlertDialogView), findsOneWidget);
  });
  testWidgets('Tapping buttons triggers actions', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: AlertDialogView(
          title: 'Test Title',
          message: 'Test Message',
          popButtonTitle: 'Cancel',
          successButtonTitle: 'Confirm',
          onPressFunction: () {},
        ),
      ),
    );

    // Tap Cancel button
    await tester.tap(find.text('Cancel'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Confirm'));
    await tester.pumpAndSettle();
  });
}
