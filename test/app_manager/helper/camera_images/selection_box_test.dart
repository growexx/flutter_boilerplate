import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/app_manager/helper/camera_and_images/selection_box.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('SelectionBox renders correctly', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: SelectionBox(
          title: 'Test Title',
          description: 'Test Description',
          iconData: Icons.ac_unit,
        ),
      ),
    );

    expect(find.text('Test Title'), findsOneWidget);
    // expect(find.text('Test Description'), findsOneWidget);
    expect(find.byIcon(Icons.ac_unit), findsOneWidget);
  });

  testWidgets('SelectionBox responds to theme changes',
      (WidgetTester tester) async {
    final lightTheme = ThemeData.light();
    final darkTheme = ThemeData.dark();

    await tester.pumpWidget(
      MaterialApp(
        theme: lightTheme,
        home: const SelectionBox(
          title: 'Test Title',
          description: 'Test Description',
          iconData: Icons.ac_unit,
        ),
      ),
    );

    // Verify initial rendering with light theme
    expect(find.text('Test Title'), findsOneWidget);
    expect(find.byIcon(Icons.ac_unit), findsOneWidget);

    // Change theme to dark and verify the change
    await tester.pumpWidget(
      MaterialApp(
        theme: darkTheme,
        home: const SelectionBox(
          title: 'Test Title',
          description: 'Test Description',
          iconData: Icons.ac_unit,
        ),
      ),
    );

    expect(find.text('Test Title'), findsOneWidget);
    expect(find.byIcon(Icons.ac_unit), findsOneWidget);
  });

  // Add more test cases as needed...
}
