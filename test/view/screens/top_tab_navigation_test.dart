import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/authentication/user.dart';
import 'package:flutter_boilerplate/authentication/user_repository.dart';
import 'package:flutter_boilerplate/view/screens/dashboard/dashboard_screen.dart';
import 'package:flutter_boilerplate/view/screens/navigation/top_tab_navigation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:network_image_mock/network_image_mock.dart';
import 'package:nock/nock.dart';
import 'package:provider/provider.dart';

import '../../util/common_initial_activity.dart';
import 'bottom_navigation_test.mocks.dart';

@GenerateNiceMocks([
  MockSpec<UserRepository>(
      as: #MockUserRepository, onMissingStub: OnMissingStub.returnDefault),
])
void main() async {
  await commonInitialActivity();
  setUpAll(() {
    nock.init();
  });

  setUp(() {
    nock.cleanAll();
  });
  testWidgets('TopTabNavigation should render tabs and content correctly',
      (WidgetTester tester) async {
    MockUserRepository mockUserRepository = MockUserRepository();
    when(mockUserRepository.currentUser).thenReturn(
        User(email: 'email', firstName: 'firstName', profileUrl: ''));
    // Build our app and trigger a frame.
    await mockNetworkImagesFor(
        () async => await tester.pumpWidget(MultiProvider(
                providers: [
                  ChangeNotifierProvider<UserRepository>.value(
                      value: mockUserRepository),
                ],
                child: MaterialApp(
                  home: TopTabNavigation(),
                ))));
    await tester.pumpAndSettle();

    // Expect to find four tabs
    expect(find.byType(Tab), findsNWidgets(4));

    // Tap on the third tab (SettingsScreen)
    await tester.tap(find.byIcon(Icons.settings));
    await tester.pumpAndSettle();

    // Expect SettingsScreen content
    expect(find.text('Settings Screen'), findsOneWidget);

    // Tap on the first tab (DashboardScreen)
    await tester.tap(find.byIcon(Icons.dashboard));
    await tester.pumpAndSettle();

    // Expect DashboardScreen content
    expect(find.byType(DashboardScreen), findsOneWidget);
  });
}
