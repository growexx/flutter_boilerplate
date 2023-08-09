import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_boilerplate/view/screens/dashboard/dashboard_screen.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nock/nock.dart';
import '../../util/common_initial_activity.dart';
import '../../util/testing_material_app.dart';

void main() async {
  await commonInitialActivity();
  setUpAll(() {
    nock.init();
  });

  setUp(() {
    nock.cleanAll();
  });
  testWidgets('DashboardScreen Widget Test', (WidgetTester tester) async {
    Widget widget = testingMaterial(initialLocation: DashboardScreen.path);
    await tester.pumpWidget(widget);
    await tester.pumpAndSettle();

    expect(find.byKey(const Key("welcome")), findsOneWidget);
    expect(find.byKey(const Key("change_password")), findsOneWidget);
    expect(find.byKey(const Key("sign_out")), findsOneWidget);
    expect(find.byKey(const Key("payment")), findsOneWidget);
    expect(find.text("Todo Screen"), findsOneWidget);
    await tester.tap(find.byKey(const Key("change_password")));
    await tester.tap(find.byKey(const Key("sign_out")));
  });
  testWidgets("test onWillPop", (WidgetTester tester) async {
    Widget widget = testingMaterial(initialLocation: DashboardScreen.path);
    await tester.pumpWidget(widget);

    await tester.tap(find.byKey(const Key("editprofile")));
    await tester.pumpAndSettle();
    await tester.sendKeyEvent(LogicalKeyboardKey.backspace);
    await tester.pumpAndSettle();
    bool willPopCalled = false;

    final dynamic widgetsAppState = tester.state(find.byType(WidgetsApp));
    await widgetsAppState.didPopRoute();
    await tester.pump();

    expect(willPopCalled, false);
  });
    testWidgets(
    "buttons are pressed",
    (WidgetTester tester) async {
      Widget widget = testingMaterial(initialLocation: DashboardScreen.path);
      await tester.pumpWidget(widget);
      await tester.tap(find.byKey(const Key("payment")));
       final dynamic widgetsAppState = tester.state(find.byType(WidgetsApp));
    await widgetsAppState.didPopRoute();
      await tester.tap(find.byKey(const Key("todo_screen")));
    },
  );
}
