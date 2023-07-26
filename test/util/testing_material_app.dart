import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'bind_with_common_orivder.dart';
import 'router_testing.dart';

Widget testingMaterial({
  String? initialLocation,
  List<RouteBase>? routesData,
}) {
  return  bindWithCommonProvider(
    child: MaterialApp.router(
        routerConfig: routerTesting(
            initialLocation: initialLocation,
          routesData: routesData,
        )
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