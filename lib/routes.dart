import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/view/screens/dashboard_screen.dart';
import 'package:flutter_boilerplate/view/screens/login/signin_screen.dart';
import 'package:flutter_boilerplate/view/screens/splash_screen.dart';
import 'package:flutter_boilerplate/view_model/google_signin_view_model.dart';
import 'package:flutter_boilerplate/view_model/signin_view_model.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import 'view/screens/main_screen.dart';
import 'view/screens/navigation/bottom_tab_navigation.dart';
import 'view/screens/navigation/drawer_navigation.dart';
import 'view/screens/navigation/top_tab_navigation.dart';
import 'view/screens/user_details_screen.dart';

// define for transition animation
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
      opacity: CurveTween(curve: Curves.easeInOutCirc).animate(animation),
      child: child,
    ),
  );
}

List<RouteBase> routes = [
  GoRoute(
    name: SplashScreen.name,
    path: SplashScreen.path,
    pageBuilder: (context, state) => buildPageWithDefaultTransition(
        context: context, state: state, child: const SplashScreen()),
  ),
  GoRoute(
    name: SigninScreen.name,
    path: SigninScreen.path,
    pageBuilder: (context, state) => buildPageWithDefaultTransition(
        context: context,
        state: state,
        child: MultiProvider(providers: [
          ChangeNotifierProvider<GoogleSigninViewModel>(
            create: (_) => GoogleSigninViewModel(),
          ),
          ChangeNotifierProvider<SigninViewModel>(
            create: (_) => SigninViewModel(),
          ),
        ], child: const SigninScreen())),
  ),
  GoRoute(
    name: DashboardScreen.name,
    path: DashboardScreen.path,
    pageBuilder: (context, state) => buildPageWithDefaultTransition(
        context: context, state: state, child: const DashboardScreen()),
  ),
  GoRoute(
    name: MainScreen.name,
    path: MainScreen.path,
    pageBuilder: (context, state) => buildPageWithDefaultTransition(
        context: context, state: state, child: const MainScreen()),
  ),
  GoRoute(
    name: BottomTabNavigation.name,
    path: BottomTabNavigation.path,
    pageBuilder: (context, state) => buildPageWithDefaultTransition(
        context: context, state: state, child: const BottomTabNavigation()),
  ),
  GoRoute(
    name: DrawerNavigation.name,
    path: DrawerNavigation.path,
    pageBuilder: (context, state) => buildPageWithDefaultTransition(
        context: context, state: state, child: const DrawerNavigation()),
  ),
  GoRoute(
    name: TopTabNavigation.name,
    path: TopTabNavigation.path,
    pageBuilder: (context, state) => buildPageWithDefaultTransition(
        context: context, state: state, child: TopTabNavigation()),
  ),
  GoRoute(
    name: UserDetailsScreen.name,
    path: UserDetailsScreen.path,
    pageBuilder: (context, state) => buildPageWithDefaultTransition(
        context: context, state: state, child: UserDetailsScreen()),
  ),
];
