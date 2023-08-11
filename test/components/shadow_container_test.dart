import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/app_manager/component/shadow_container.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Shadow Container Test', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: Scaffold(
        body: ShadowContainer(),
      ),
    ));
    await tester.pumpAndSettle();
    // Verify the initial state
    expect(find.byKey(const Key('key_shadow_container')), findsOneWidget);
  });
}
