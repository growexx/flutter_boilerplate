
import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/authentication/user_repository.dart';
import 'package:flutter_boilerplate/go_router/error_screen.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

import '../util/router_testing.dart';



void main() {

  testWidgets('Match no Routes', (WidgetTester tester) async {
    Widget widget =       ChangeNotifierProvider<UserRepository>(
      create: (_) => UserRepository(),
      child: MaterialApp.router(
        routerConfig: routerTesting(initialLocation: '/foo'),
      ),
    );
    await tester.pumpWidget(widget);
    expect(find.byType(ErrorScreen), findsOneWidget);

    expect(find.text('The page you are looking for does not exist'), findsOneWidget);

    await tester.tap(find.byType(TextButton));

    await tester.pumpAndSettle(const Duration(seconds: 2));
  });

}