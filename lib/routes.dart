import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/view/screens/dashboard_screen.dart';
import 'package:flutter_boilerplate/view/screens/login_screen.dart';
import 'package:flutter_boilerplate/view/screens/otp_screen.dart';
import 'package:flutter_boilerplate/view/screens/signup_screen.dart';
import 'package:flutter_boilerplate/view/screens/splash_screen.dart';
import 'package:flutter_boilerplate/viewmodel/login_view_model.dart';
import 'package:flutter_boilerplate/viewmodel/otp_view_model.dart';
import 'package:flutter_boilerplate/viewmodel/signup_view_model.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

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
      name: LoginScreen.name,
      path: LoginScreen.path,
      pageBuilder: (context, state) => buildPageWithDefaultTransition(
            context: context,
            state: state,
            child: MultiProvider(
              providers: [
                ChangeNotifierProvider<LoginViewModel>(
                  create: (_) => LoginViewModel(),
                ),
              ],
              child: const LoginScreen(),
            ),
          )),
  GoRoute(
    name: DashboardScreen.name,
    path: DashboardScreen.path,
    pageBuilder: (context, state) => buildPageWithDefaultTransition(
        context: context, state: state, child: const DashboardScreen()),
  ),
  GoRoute(
    name: SignUpScreen.name,
    path: SignUpScreen.path,
    pageBuilder: (context, state) => buildPageWithDefaultTransition(
      context: context,
      state: state,
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider<SignUpViewModel>(
            create: (_) => SignUpViewModel(),
          ),
        ],
        child: const SignUpScreen(),
      ),
    ),
  ),
  GoRoute(
      name: OTPScreen.name,
      path: OTPScreen.path,
      pageBuilder: (context, state) => buildPageWithDefaultTransition(
            context: context,
            state: state,
            child: MultiProvider(
              providers: [
                ChangeNotifierProvider<OTPViewModel>(
                  create: (_) => OTPViewModel(),
                ),
              ],
              child: const OTPScreen(),
            ),
          )),
];
