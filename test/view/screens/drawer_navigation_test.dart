import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/app_manager/theme/theme_provider.dart';
import 'package:flutter_boilerplate/authentication/user_repository.dart';
import 'package:flutter_boilerplate/view/screens/navigation/drawer_navigation.dart';
import 'package:flutter_boilerplate/view_model/signin_view_model.dart';
import 'package:flutter_boilerplate/view_model/social_signin_view_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:nock/nock.dart';
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

void main() {
  setUpAll(() {
    nock.init();
  });

  setUp(() {
    nock.cleanAll();
  });
  group("Drawer Navigation test", () {
    testWidgets('DrawerNavigation should show DashboardScreen by default',
        (WidgetTester tester) async {
      await tester
          .pumpWidget(testingMaterial(initialLocation: DrawerNavigation.path));
      await tester.pumpAndSettle();
      // Expect to see the DashboardScreen content on the screen
      expect(find.byType(Text), findsWidgets);
    });
  });
}
