import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/view/screens/change_password/change_password_screen.dart';
import 'package:flutter_boilerplate/view/screens/dashboard/dashboard_screen.dart';
import 'package:flutter_boilerplate/view/screens/forgot_password/forgot_password_screen.dart';
import 'package:flutter_boilerplate/view/screens/otp/otp_screen.dart';
import 'package:flutter_boilerplate/view/screens/pin_support/widget/security_pin_screen.dart';
import 'package:flutter_boilerplate/view/screens/signin/signin_screen.dart';
import 'package:flutter_boilerplate/view/screens/signup/signup_screen.dart';
import 'package:flutter_boilerplate/view/screens/splash/splash_screen.dart';
import 'package:flutter_boilerplate/view/screens/payment/payment_screen.dart';
import 'package:flutter_boilerplate/view_model/security_pin_view_model.dart';
import 'package:flutter_boilerplate/view_model/social_signin_view_model.dart';
import 'package:flutter_boilerplate/view_model/otp_view_model.dart';
import 'package:flutter_boilerplate/view_model/signin_view_model.dart';
import 'package:flutter_boilerplate/view_model/change_password_view_model.dart';
import 'package:flutter_boilerplate/view_model/forgot_password_view_model.dart';
import 'package:flutter_boilerplate/view_model/signup_view_model.dart';
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
    name: SecurityPinScreen.name,
    path: SecurityPinScreen.path,
    pageBuilder: (context, state) => buildPageWithDefaultTransition(
        context: context, state: state, child: MultiProvider(
      providers: [
        ChangeNotifierProvider<SecurityPinViewModel>(
          create: (_) => SecurityPinViewModel(),
        ),
      ],
      child: const SecurityPinScreen(),
    ),)
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
                ChangeNotifierProvider<SocialSignInViewModel>(
                  create: (_) => SocialSignInViewModel(),
                ),
              ],
              child: const OTPScreen(),
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
          ChangeNotifierProvider<SocialSignInViewModel>(
            create: (_) => SocialSignInViewModel(),
          ),
          ChangeNotifierProvider<SignInViewModel>(
            create: (_) => SignInViewModel(),
          ),
        ], child: const SignInScreen())),
  ),
  GoRoute(
    name: PaymentScreen.name,
    path: PaymentScreen.path,
    pageBuilder: (context, state) => buildPageWithDefaultTransition(
        context: context, state: state,
        child: const PaymentScreen()),
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
