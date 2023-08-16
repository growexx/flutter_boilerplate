import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/app_manager/theme/theme_provider.dart';
import 'package:flutter_boilerplate/authentication/user_repository.dart';
import 'package:flutter_boilerplate/view/screens/navigation/drawer_navigation.dart';
import 'package:flutter_boilerplate/view_model/signin_view_model.dart';
import 'package:flutter_boilerplate/view_model/social_signin_view_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:network_image_mock/network_image_mock.dart';
import 'package:nock/nock.dart';
import '../../util/common_initial_activity.dart';
import '../../util/testing_material_app.dart';

@GenerateNiceMocks([
  MockSpec<UserRepository>(
      as: #MockUserRepository, onMissingStub: OnMissingStub.returnDefault),
])
@GenerateNiceMocks([
  MockSpec<ThemeProvider>(
      as: #MockThemeProvider, onMissingStub: OnMissingStub.returnDefault),
])
@GenerateNiceMocks([
  MockSpec<SignInViewModel>(
      as: #MockSigninViewModel, onMissingStub: OnMissingStub.returnDefault),
])
class MockSocialSignInViewModel extends Mock implements SocialSignInViewModel {}

void main() async {
  await commonInitialActivity();
  setUpAll(() {
    nock.init();
  });

  setUp(() {
    nock.cleanAll();
  });
  group("Drawer Navigation test", () {
    testWidgets('DrawerNavigation should show DashboardScreen by default',
        (WidgetTester tester) async {
      await mockNetworkImagesFor(() =>tester
          .pumpWidget(testingMaterial(initialLocation: DrawerNavigation.path)));
      await tester.pumpAndSettle();
      // Expect to see the DashboardScreen content on the screen
      final ScaffoldState state =
          tester.state(find.byKey(const Key("scaffold-key")));
      state.openDrawer();
      await tester.pumpAndSettle();
      // await tester.tap(find.byKey(const Key('settings-key')),
      //     warnIfMissed: false);
      // await tester.pumpAndSettle();
      expect(find.text('Dashboard'), findsWidgets);
    });

    testWidgets(
        'DrawerNavigation should show Navigtaion Screen when navigation is pressed',
        (WidgetTester tester) async {
      await tester
          .pumpWidget(testingMaterial(initialLocation: DrawerNavigation.path));
      await tester.pumpAndSettle();
      // Expect to see the DashboardScreen content on the screen
      final ScaffoldState state =
          tester.state(find.byKey(const Key("scaffold-key")));
      state.openDrawer();
      await tester.pumpAndSettle();
      await tester.tap(find.byKey(const Key('navigation-screen-key')),
          warnIfMissed: false);
      await tester.pumpAndSettle();
    });

    testWidgets(
        'DrawerNavigation should show Navigtaion Screen when logout is pressed',
        (WidgetTester tester) async {
      await tester
          .pumpWidget(testingMaterial(initialLocation: DrawerNavigation.path));
      await tester.pumpAndSettle();
      // Expect to see the DashboardScreen content on the screen
      final ScaffoldState state =
          tester.state(find.byKey(const Key("scaffold-key")));
      state.openDrawer();
      await tester.pumpAndSettle();
      await tester.tap(find.byKey(const Key('logout-key')),
          warnIfMissed: false);
      await tester.pumpAndSettle();
    });
  });
}
