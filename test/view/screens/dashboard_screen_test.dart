
import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/view/screens/dashboard/dashboard_screen.dart';
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

    expect(find.byKey(const Key("welcome")), findsOneWidget);
    expect(find.byKey(const Key("change_password")), findsOneWidget);
    expect(find.byKey(const Key("sign_out")), findsOneWidget);
    expect(find.byKey(const Key("payment")), findsOneWidget);


  });
}