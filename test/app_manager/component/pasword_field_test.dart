
import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/app_manager/component/password_field.dart';
import 'package:flutter_test/flutter_test.dart';


void main() {
  group('PasswordField Widget', () {
    late TextEditingController controller;
    late Widget passwordField;

    setUp(() {
      controller = TextEditingController();
      passwordField = MaterialApp(
        home: Scaffold(
          body: PasswordField(
            controller: controller,
            labelText: 'Password',
            hintText: 'Enter your password',
          ),
        ),
      );
    });

    testWidgets('Initial state', (WidgetTester tester) async {
      await tester.pumpWidget(passwordField);
      expect(find.byType(TextFormField), findsOneWidget);
      expect(find.byType(IconButton), findsOneWidget);
      expect(controller.text, '');
    });

    testWidgets('Toggle password visibility', (WidgetTester tester) async {
      await tester.pumpWidget(passwordField);
      await tester.tap(find.byType(IconButton));
      await tester.pump();
      await tester.tap(find.byType(IconButton));
      await tester.pump();
    });

    testWidgets('Enter text and submit field', (WidgetTester tester) async {
      await tester.pumpWidget(passwordField);

      await tester.enterText(find.byType(TextFormField), 'password123');
      expect(controller.text, 'password123');

      await tester.testTextInput.receiveAction(TextInputAction.done);
    });


  });
}
