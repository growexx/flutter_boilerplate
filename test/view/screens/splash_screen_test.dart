import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/app_manager/constant/app_constant.dart';
import 'package:flutter_boilerplate/view/screens/splash_screen.dart';
import 'package:flutter_test/flutter_test.dart';
import '../../util/testing_material_app.dart';
void main() {
  testWidgets('SplashScreen Widget Test', (WidgetTester tester) async {
    Widget widget = testingMaterial(
        initialLocation: SplashScreen.path
    );
    await tester.pumpWidget(widget);
    expect(find.text(AppConstant.appName), findsOneWidget);
    await tester.pumpAndSettle(const Duration(seconds: 2));
    await tester.pumpAndSettle();
  });
}