import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/authentication/user.dart';
import 'package:flutter_boilerplate/authentication/user_repository.dart';
import 'package:flutter_boilerplate/view/screens/navigation/top_tab_navigation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_boilerplate/view/screens/dashboard_screen.dart';
import 'package:flutter_boilerplate/view/screens/user_details_screen.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:network_image_mock/network_image_mock.dart';
import 'package:provider/provider.dart';

import 'bottom_navigation_test.mocks.dart';

@GenerateNiceMocks([
  MockSpec<UserRepository>(
      as: #MockUserRepository, onMissingStub: OnMissingStub.returnDefault),
])
void main() {
  testWidgets('TopTabNavigation should render tabs and content correctly',
      (WidgetTester tester) async {
    MockUserRepository mockUserRepository = MockUserRepository();
    when(mockUserRepository.currentUser).thenReturn(
        User(email: 'email', firstName: 'firstName', profileUrl: ''));
    // Build our app and trigger a frame.
    await mockNetworkImagesFor(() => tester.pumpWidget(MultiProvider(
            providers: [
              ChangeNotifierProvider<UserRepository>.value(
                  value: mockUserRepository),
            ],
            child: MaterialApp(
              home: TopTabNavigation(),
            ))));

    // Expect to find four tabs
    expect(find.byType(Tab), findsNWidgets(4));

    // Tap on the second tab (UserDetailsScreen)
    await tester.tap(find.byIcon(Icons.person));
    await tester.pumpAndSettle();

    // Expect UserDetailsScreen content
    expect(find.byType(UserDetailsScreen), findsOneWidget);

    // Tap on the third tab (SettingsScreen)
    await tester.tap(find.byIcon(Icons.settings));
    await tester.pumpAndSettle();

    // Expect SettingsScreen content
    expect(find.text('Settings Screen'), findsOneWidget);

    // Tap on the fourth tab (ChatScreen)
    await tester.tap(find.byIcon(Icons.chat));
    await tester.pumpAndSettle();

    // Expect ChatScreen content
    expect(find.text('Chat Screen'), findsOneWidget);

    // Tap on the first tab (DashboardScreen)
    await tester.tap(find.byIcon(Icons.dashboard));
    await tester.pumpAndSettle();

    // Expect DashboardScreen content
    expect(find.byType(DashboardScreen), findsOneWidget);
  });
}
