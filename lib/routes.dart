import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/view/screens/change_password/change_password_screen.dart';
import 'package:flutter_boilerplate/view/screens/dashboard/dashboard_screen.dart';
import 'package:flutter_boilerplate/view/screens/forgot_password/forgot_password_screen.dart';
import 'package:flutter_boilerplate/view/screens/otp/otp_screen.dart';
import 'package:flutter_boilerplate/view/screens/otp/otp_verification_screen.dart';
import 'package:flutter_boilerplate/view/screens/signin/signin_screen.dart';
import 'package:flutter_boilerplate/view/screens/signup/signup_screen.dart';
import 'package:flutter_boilerplate/view/screens/splash/splash_screen.dart';
import 'package:flutter_boilerplate/view_model/google_signin_view_model.dart';
import 'package:flutter_boilerplate/view_model/otp_view_model.dart';
import 'package:flutter_boilerplate/view_model/signin_view_model.dart';
import 'package:flutter_boilerplate/view_model/change_password_view_model.dart';
import 'package:flutter_boilerplate/view_model/forgot_password_view_model.dart';
import 'package:flutter_boilerplate/view_model/otp_verification_view_model.dart';
import 'package:flutter_boilerplate/view_model/signup_view_model.dart';
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
  GoRoute(
      name: OTPVerificationScreen.name,
      path: OTPVerificationScreen.path,
      pageBuilder: (context, state) => buildPageWithDefaultTransition(
            context: context,
            state: state,
            child: MultiProvider(
              providers: [
                ChangeNotifierProvider<OTPVerificationViewModel>(
                  create: (_) => OTPVerificationViewModel(),
                ),
              ],
              child: const OTPVerificationScreen(),
            ),
          )),
  GoRoute(
      name: ChangePasswordScreen.name,
      path: ChangePasswordScreen.path,
      pageBuilder: (context, state) => buildPageWithDefaultTransition(
            context: context,
            state: state,
            child: MultiProvider(
              providers: [
                ChangeNotifierProvider<ChangePasswordViewModel>(
                  create: (_) => ChangePasswordViewModel(),
                ),
              ],
              child: const ChangePasswordScreen(),
            ),
          )),
  GoRoute(
      name: ForgotPasswordScreen.name,
      path: ForgotPasswordScreen.path,
      pageBuilder: (context, state) => buildPageWithDefaultTransition(
            context: context,
            state: state,
            child: MultiProvider(
              providers: [
                ChangeNotifierProvider<ForgotPasswordViewModel>(
                  create: (_) => ForgotPasswordViewModel(),
                ),
              ],
              child: const ForgotPasswordScreen(),
            ),
          )),
  GoRoute(
    name: SignInScreen.name,
    path: SignInScreen.path,
    pageBuilder: (context, state) => buildPageWithDefaultTransition(
        context: context,
        state: state,
        child: MultiProvider(providers: [
          ChangeNotifierProvider<GoogleSigninViewModel>(
            create: (_) => GoogleSigninViewModel(),
          ),
          ChangeNotifierProvider<SignInViewModel>(
            create: (_) => SignInViewModel(),
          ),
        ], child: const SignInScreen())),
  ),
];
