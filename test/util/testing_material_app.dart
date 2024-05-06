import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/authentication/user.dart';
import 'package:go_router/go_router.dart';
import 'bind_with_common_proivder.dart';
import 'router_testing.dart';

Widget testingMaterial({
  String? initialLocation,
  List<RouteBase>? routesData,
  Widget? child,
  bool? withUser,
  User? user,
}) {
  return  bindWithCommonProvider(
    withUser: withUser,
    user: user,
    child: MaterialApp.router(
        routerConfig: routerTesting(
          initialLocation: initialLocation,
          routesData: routesData,
        ),
        /// uncomment to add FToastBuilder in material testing
        // builder: FToastBuilder()
    ),
  );
}



Widget testingWidget({
  required Widget child,
}) {
  return  bindWithCommonProvider(
    child: MaterialApp(
        home: Scaffold(body: child)),
  );
}