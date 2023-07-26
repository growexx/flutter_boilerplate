
import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/view/screens/dashboard_screen.dart';
import 'package:flutter_test/flutter_test.dart';
import '../../util/common_initial_activity.dart';
import '../../util/testing_material_app.dart';


void main() async{
  await commonInitialActivity();
  testWidgets('DashboardScreen Widget Test', (WidgetTester tester) async {
    Widget widget =  testingMaterial(
        initialLocation: DashboardScreen.path
    );
    await tester.pumpWidget(widget);
    await tester.pumpAndSettle();
  });
}