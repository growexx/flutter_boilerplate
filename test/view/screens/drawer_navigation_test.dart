import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/app_manager/theme/theme_provider.dart';
import 'package:flutter_boilerplate/authentication/user.dart';
import 'package:flutter_boilerplate/authentication/user_repository.dart';
import 'package:flutter_boilerplate/routes.dart';
import 'package:flutter_boilerplate/view/screens/login/signin_screen.dart';
import 'package:flutter_boilerplate/view/screens/navigation/drawer_navigation.dart';
import 'package:flutter_boilerplate/view_model/google_signin_view_model.dart';
import 'package:flutter_boilerplate/view_model/signin_view_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_boilerplate/view/screens/user_details_screen.dart';
import 'package:flutter_boilerplate/view/screens/main_screen.dart';
import 'package:go_router/go_router.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';
import 'drawer_navigation_test.mocks.dart';

@GenerateNiceMocks([
  MockSpec<UserRepository>(
      as: #MockUserRepository, onMissingStub: OnMissingStub.returnDefault),
])
@GenerateNiceMocks([
  MockSpec<ThemeProvider>(
      as: #MockThemeProvider, onMissingStub: OnMissingStub.returnDefault),
])
@GenerateNiceMocks([
  MockSpec<SigninViewModel>(
      as: #MockSigninViewModel, onMissingStub: OnMissingStub.returnDefault),
])
class MockGoogleSigninViewModel extends Mock implements GoogleSigninViewModel {}

void main() {
  group("Drawer Navigation test", () {
    testWidgets('DrawerNavigation should show DashboardScreen by default',
        (WidgetTester tester) async {
      MockUserRepository mockUserRepository = MockUserRepository();
      await tester.pumpWidget(
        MultiProvider(
          providers: [
            ChangeNotifierProvider<UserRepository>.value(
                value: mockUserRepository),
          ],
          child: const MaterialApp(
            home: DrawerNavigation(),
          ),
        ),
      );

      // Expect to see the DashboardScreen content on the screen
      expect(find.text('Welcome'), findsOneWidget);
    });

    testWidgets('DrawerNavigation should show UserDetailsScreen when tapped',
        (WidgetTester tester) async {
      MockUserRepository mockUserRepository = MockUserRepository();
      when(mockUserRepository.currentUser).thenReturn(
          User(email: 'email', firstName: 'firstName', profileUrl: ''));
      final router = GoRouter(
        routes: [
          GoRoute(
            path: '/',
            builder: (context, state) => const DrawerNavigation(),
          ),
          GoRoute(
            name: UserDetailsScreen.name,
            path: UserDetailsScreen.path,
            pageBuilder: (context, state) => buildPageWithDefaultTransition(
                context: context, state: state, child: UserDetailsScreen()),
          ),
        ],
      );
      await tester.pumpWidget(
        MultiProvider(
          providers: [
            ChangeNotifierProvider<UserRepository>.value(
                value: mockUserRepository),
          ],
          child: MaterialApp.router(
            routerConfig: router,
          ),
        ),
      );

      // Tap on the User Profile list tile in the drawer
      await tester.tap(find.byIcon(Icons.menu));
      await tester.pumpAndSettle();
      await tester.tap(find.byIcon(Icons.person));
      await tester.pumpAndSettle();

      // Expect to see the UserDetailsScreen content on the screen
      expect(find.byType(UserDetailsScreen), findsOneWidget);
      expect(find.byIcon(Icons.camera),
          findsNothing); // Check that the camera button is not visible
    });

    testWidgets('DrawerNavigation should show MainScreen when tapped',
        (WidgetTester tester) async {
      MockUserRepository mockUserRepository = MockUserRepository();
      final router = GoRouter(
        routes: [
          GoRoute(
            path: '/',
            builder: (context, state) => const DrawerNavigation(),
          ),
          GoRoute(
            name: MainScreen.name,
            path: MainScreen.path,
            pageBuilder: (context, state) => buildPageWithDefaultTransition(
                context: context, state: state, child: const MainScreen()),
          ),
        ],
      );
      await tester.pumpWidget(
        MultiProvider(
          providers: [
            ChangeNotifierProvider<UserRepository>.value(
                value: mockUserRepository),
          ],
          child: MaterialApp.router(
            routerConfig: router,
          ),
        ),
      );

      // Tap on the Main Screen list tile in the drawer
      await tester.tap(find.byIcon(Icons.menu));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Main Screen'));
      await tester.pumpAndSettle();

      // Expect to see the MainScreen content on the screen
      expect(find.byType(MainScreen), findsOneWidget);
    });

    testWidgets('DrawerNavigation should show Login Screen when tapped',
        (WidgetTester tester) async {
      MockUserRepository mockUserRepository = MockUserRepository();
      MockSigninViewModel mockSigninViewModel = MockSigninViewModel();
      MockGoogleSigninViewModel mockGoogleSigninViewModel =
          MockGoogleSigninViewModel();

      MockThemeProvider mockThemeProvider = MockThemeProvider();
      when(mockSigninViewModel.emailC.text).thenReturn("email");
      when(mockSigninViewModel.passwordC.text).thenReturn("pass");
      final router = GoRouter(
        routes: [
          GoRoute(
            path: '/',
            builder: (context, state) => const DrawerNavigation(),
          ),
          GoRoute(
            name: SigninScreen.name,
            path: SigninScreen.path,
            pageBuilder: (context, state) => buildPageWithDefaultTransition(
                context: context, state: state, child: const SigninScreen()),
          ),
        ],
      );
      await tester.pumpWidget(
        MultiProvider(
          providers: [
            ChangeNotifierProvider<UserRepository>.value(
                value: mockUserRepository),
            ChangeNotifierProvider<ThemeProvider>.value(
                value: mockThemeProvider),
            ChangeNotifierProvider<SigninViewModel>.value(
                value: mockSigninViewModel),
            ChangeNotifierProvider<GoogleSigninViewModel>.value(
                value: mockGoogleSigninViewModel),
          ],
          child: MaterialApp.router(
            routerConfig: router,
          ),
        ),
      );

      // Tap on the Main Screen list tile in the drawer
      await tester.tap(find.byIcon(Icons.menu));
      await tester.pumpAndSettle();
      await tester.tap(find.byIcon(Icons.logout));
      await tester.pumpAndSettle();

      // Expect to see the MainScreen content on the screen
      expect(find.byType(SigninScreen), findsOneWidget);
    });
  });
}
