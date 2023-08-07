import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'app_manager/models/todo_data.dart';
import 'view/screens/screens.dart';
import 'view_model/veiw_model.dart';

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
            context: context,
            state: state,
            child: MultiProvider(
              providers: [
                ChangeNotifierProvider<SecurityPinViewModel>(
                  create: (_) => SecurityPinViewModel(),
                ),
              ],
              child: const SecurityPinScreen(),
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
        context: context, state: state, child: const PaymentScreen()),
  ),
  GoRoute(
    name: StripePaymentScreen.name,
    path: StripePaymentScreen.path,
    pageBuilder: (context, state) => buildPageWithDefaultTransition(
        context: context, state: state, child: const StripePaymentScreen()),
  ),
  GoRoute(
    name: RecentChats.name,
    path: RecentChats.path,
    pageBuilder: (context, state) => buildPageWithDefaultTransition(
      context: context,
      state: state,
      child: MultiProvider(providers: [
        ChangeNotifierProvider<ChatViewModel>(
          create: (_) => ChatViewModel(),
        ),
      ], child: const RecentChats()),
    ),
  ),
  GoRoute(
    name: ChatScreen.name,
    path: ChatScreen.path,
    pageBuilder: (context, state) => buildPageWithDefaultTransition(
      context: context,
      state: state,
      child: MultiProvider(providers: [
        ChangeNotifierProvider<ChatViewModel>(
          create: (_) => ChatViewModel(),
        ),
      ], child: const ChatScreen()),
    ),
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
  GoRoute(
    name: EditProfileScreen.name,
    path: EditProfileScreen.path,
    pageBuilder: (context, state) => buildPageWithDefaultTransition(
      context: context,
      state: state,
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider<EditProfileViewModel>(
            create: (_) => EditProfileViewModel(),
          ),
        ],
        child: const EditProfileScreen(),
      ),
    ),
  ),
  GoRoute(
      name: GoogleMapScreen.name,
      path: GoogleMapScreen.path,
      pageBuilder: (context, state) => buildPageWithDefaultTransition(
            context: context,
            state: state,
            child: MultiProvider(
              providers: [
                ChangeNotifierProvider<GoogleMapViewModel>(
                  create: (_) => GoogleMapViewModel(),
                ),
              ],
              child: const GoogleMapScreen(),
            ),
          )),
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
    name: AddEditTodoScreen.name,
    path: AddEditTodoScreen.path,
    pageBuilder: (context, state) => buildPageWithDefaultTransition(
        context: context,
        state: state,
        child: ChangeNotifierProvider<HiveModel>(
            create: (context) => HiveModel(),
            child: AddEditTodoScreen(
              data: state.extra as TodoData?,
            ))),
  ),
];
