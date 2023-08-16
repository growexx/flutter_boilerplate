import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/app_manager/constant/app_constant.dart';
import 'package:flutter_boilerplate/view/screens/splash_screen.dart';
import 'package:flutter_test/flutter_test.dart';
import '../../util/common_initial_activity.dart';
import '../../util/testing_material_app.dart';

void main() async{
  await commonInitialActivity();
  group("Splash Screen Test", () {


    testWidgets('SplashScreen', (WidgetTester tester) async {
      Widget widget = testingMaterial(
          initialLocation: SplashScreen.path
      );
      await tester.pumpWidget(widget);
      expect(find.text(AppConstant.appName.tr()), findsOneWidget);
      await tester.pumpAndSettle(const Duration(seconds: 2));
      await tester.pumpAndSettle();
    });


    testWidgets('In DeskTop Variant', (WidgetTester tester) async {
      Widget widget = testingMaterial(
          initialLocation: SplashScreen.path
      );
      await tester.pumpWidget(widget);
      await tester.pumpAndSettle(const Duration(seconds: 2));
      await tester.pumpAndSettle();


    },variant: TargetPlatformVariant.desktop());

  });
}