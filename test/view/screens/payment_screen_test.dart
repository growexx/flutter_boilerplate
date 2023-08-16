import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/view/screens/payment/payment_screen.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pay/pay.dart';
import '../../util/common_initial_activity.dart';
import '../../util/testing_material_app.dart';

void main() async {
  await commonInitialActivity();
  testWidgets('PaymentScreen Widget Test - Apple Pay button check',
      (WidgetTester tester) async {
    debugDefaultTargetPlatformOverride = TargetPlatform.iOS;
    Widget widget = testingMaterial(initialLocation: PaymentScreen.path);
    await tester.pumpWidget(widget);
    final Finder apple = find.byType(ApplePayButton);
    expect(apple, findsOneWidget);
    await tester.tap(find.byType(MaterialButton));
    onApplePayResult("");
    onGooglePayResult("");
    debugDefaultTargetPlatformOverride = null;
  });

  testWidgets('PaymentScreen Widget Test - Google Pay button check',
      (WidgetTester tester) async {
    debugDefaultTargetPlatformOverride = TargetPlatform.android;
    Widget widget = testingMaterial(initialLocation: PaymentScreen.path);
    await tester.pumpWidget(widget);
    final Finder android = find.byType(GooglePayButton);
    expect(android, findsOneWidget);
    debugDefaultTargetPlatformOverride = null;
  });

  testWidgets('PaymentScreen Widget Test - Android - Check for Web Screen',
      (WidgetTester tester) async {
    debugDefaultTargetPlatformOverride = TargetPlatform.windows;
    Widget widget = testingMaterial(initialLocation: PaymentScreen.path);
    await tester.pumpWidget(widget);
    final Finder android = find.byType(GooglePayButton);
    expect(android, findsNothing);
    final Finder apple = find.byType(ApplePayButton);
    expect(apple, findsNothing);
    debugDefaultTargetPlatformOverride = null;
  });
}
