import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/app_manager/theme/theme_provider.dart';
import 'package:flutter_boilerplate/authentication/user_repository.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import 'router_testing.dart';

Widget testingMaterial({
  String? initialLocation,
  List<RouteBase>? routesData,
}) {
  return  MultiProvider(
    providers: [
      ChangeNotifierProvider<UserRepository>(
        create: (_) => UserRepository(),),
      ChangeNotifierProvider<ThemeProvider>(
        create: (_) => ThemeProvider(),),
    ],
    child: MaterialApp.router(
        routerConfig: routerTesting(
            initialLocation: initialLocation,
          routesData: routesData,
        )
    ),
  );
}