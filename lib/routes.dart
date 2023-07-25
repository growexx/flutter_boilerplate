
import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/view/screens/dashboard_screen.dart';
import 'package:flutter_boilerplate/view/screens/login_screen.dart';
import 'package:flutter_boilerplate/view/screens/splash_screen.dart';
import 'package:go_router/go_router.dart';

CustomTransitionPage buildPageWithDefaultTransition<T>({
  required BuildContext context,
  required GoRouterState state,
  required Widget child,
}) {
  return CustomTransitionPage<T>(
    key: state.pageKey,
    child: child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) =>
        FadeTransition(
          opacity:
          CurveTween(curve: Curves.easeInOutCirc).animate(animation),
          child: SelectionArea(
              child: child),
        ),
  );
}


List<RouteBase> routes = [
  GoRoute(
    name: SplashScreen.name,
    path: SplashScreen.path,
    pageBuilder: (context, state) => buildPageWithDefaultTransition(
        context: context, state: state,
        child: const SplashScreen()),
  ),
  GoRoute(
    name: LoginScreen.name,
    path: LoginScreen.path,
    pageBuilder: (context, state) => buildPageWithDefaultTransition(
        context: context, state: state,
        child: const LoginScreen()),
  ),
  GoRoute(
    name: DashboardScreen.name,
    path: DashboardScreen.path,
    pageBuilder: (context, state) => buildPageWithDefaultTransition(
        context: context, state: state,
        child: const DashboardScreen()),
  ),
];