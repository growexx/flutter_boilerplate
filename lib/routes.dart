
import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/app_manager/models/todo_data.dart';
import 'package:flutter_boilerplate/view/screens/dashboard_screen.dart';
import 'package:flutter_boilerplate/view/screens/payment/payment_screen.dart';
import 'package:flutter_boilerplate/view/screens/login/signin_screen.dart';
import 'package:flutter_boilerplate/view/screens/splash_screen.dart';
import 'package:flutter_boilerplate/view/screens/todo/screen/todo_data_screen.dart';
import 'package:flutter_boilerplate/view/screens/todo/screen/todo_list_screen.dart';
import 'package:flutter_boilerplate/view_model/social_signin_view_model.dart';
import 'package:flutter_boilerplate/view_model/hive_view_model.dart';
import 'package:flutter_boilerplate/view_model/signin_view_model.dart';
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
          opacity:
          CurveTween(curve: Curves.easeInOutCirc).animate(animation),
          child: child,
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
    name: SigninScreen.name,
    path: SigninScreen.path,
    pageBuilder: (context, state) => buildPageWithDefaultTransition(
        context: context, state: state,
        child: MultiProvider(
            providers: [
              ChangeNotifierProvider<GoogleSigninViewModel>(
                create: (_)=> GoogleSigninViewModel(),),
              ChangeNotifierProvider<SigninViewModel>(
                create: (_)=> SigninViewModel(),),
            ],child: const SigninScreen())),
  ),
  GoRoute(
    name: DashboardScreen.name,
    path: DashboardScreen.path,
    pageBuilder: (context, state) => buildPageWithDefaultTransition(
        context: context, state: state,
        child: const DashboardScreen()),
  ),
    GoRoute(
    name: PaymentScreen.name,
    path: PaymentScreen.path,
    pageBuilder: (context, state) => buildPageWithDefaultTransition(
        context: context, state: state,
        child: const PaymentScreen()),
  ),
  GoRoute(
    name: TodoListScreen.name,
    path: TodoListScreen.path,
    pageBuilder: (context, state) => buildPageWithDefaultTransition(
        context: context,
        state: state,
        child: ChangeNotifierProvider<HiveModel>(
            create: (context) => HiveModel(), child: const TodoListScreen())),
  ),
  GoRoute(
    name: AddTodoDataScreen.name,
    path: AddTodoDataScreen.path,
    pageBuilder: (context, state) => buildPageWithDefaultTransition(
        context: context,
        state: state,
        child: ChangeNotifierProvider<HiveModel>(
            create: (context) => HiveModel(), child:  AddTodoDataScreen(data: state.extra as TodoData? ,))),
  ),
];