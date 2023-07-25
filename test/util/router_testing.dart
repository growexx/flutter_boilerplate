import 'package:flutter_boilerplate/app_manager/service/navigation_service.dart';
import 'package:flutter_boilerplate/go_router/error_screen.dart';
import 'package:flutter_boilerplate/routes.dart';
import 'package:go_router/go_router.dart';

GoRouter routerTesting({
  required String initialLocation,
  List<RouteBase>? routesData,
}) {
  return  GoRouter(
    initialLocation: initialLocation,
    routes: routesData?? routes,
    errorBuilder: (context, state) => const ErrorScreen(),
    navigatorKey: NavigationService.navigatorKey,
  );
}