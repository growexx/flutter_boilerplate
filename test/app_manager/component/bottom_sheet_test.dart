import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/app_manager/component/bottom_sheet/functional_sheet.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';

import '../../util/router_testing.dart';

void main() {
  testWidgets('Bottom Sheet Widget Test', (WidgetTester tester) async {
    Widget widget = MaterialApp.router(
      routerConfig: routerTesting(routesData: [
        GoRoute(
          path: "/",
          builder: (context, state) => Scaffold(
            body: FunctionalSheet(
                message: "Test", buttonName: "Done", onPressButton: () {}),
          ),
        ),
      ],),
    );

    await tester.pumpWidget(widget);
    expect(find.text('Test'), findsOneWidget);
    expect(find.text('DONE'), findsOneWidget);
    expect(find.text('CANCEL'), findsOneWidget);

    final Finder function = find.byKey(
      const Key("function"),
    );
    await tester.tap(
      function,
    );
    await tester.pumpAndSettle(const Duration(seconds: 3));

    final Finder cancel = find.byKey(
      const Key("cancel"),
    );
    await tester.tap(
      cancel,
    );

    await tester.pumpAndSettle(const Duration(seconds: 3));
  });

  testWidgets('Bottom Sheet Widget Testing for false case',
      (WidgetTester tester) async {
    Widget widget = MaterialApp.router(
      routerConfig: routerTesting(routesData: [
        GoRoute(
          path: "/",
          builder: (context, state) => Scaffold(
            body: FunctionalSheet(
                message: "Test",
                buttonName: "Done",
                onPressButton: () {},
                showCancelButton: false),
          ),
        ),
      ]),
    );

    await tester.pumpWidget(widget);
    expect(find.text('Test'), findsOneWidget);
    expect(find.text('DONE'), findsOneWidget);
    expect(find.text('CANCEL'), findsNothing);
    expect(find.byType(Container), findsOneWidget);
    final Finder function = find.byKey(
      const Key("function"),
    );
    await tester.tap(
      function,
    );
  });
}
