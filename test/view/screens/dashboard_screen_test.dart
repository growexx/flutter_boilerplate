import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/authentication/user_repository.dart';
import 'package:flutter_boilerplate/view/screens/dashboard_screen.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

import '../../util/router_testing.dart';
void main() {
  testWidgets('DashboardScreen Widget Test', (WidgetTester tester) async {
    Widget widget =        ChangeNotifierProvider<UserRepository>(
      create: (_) => UserRepository(),
      child: MaterialApp.router(
          routerConfig: routerTesting(
              initialLocation: DashboardScreen.path
          )
      ),
    );
    await tester.pumpWidget(widget);
    await tester.pumpAndSettle();
  });
}