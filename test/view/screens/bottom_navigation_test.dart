import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/authentication/user.dart';
import 'package:flutter_boilerplate/authentication/user_repository.dart';
import 'package:flutter_boilerplate/view/screens/navigation/bottom_tab_navigation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_boilerplate/view/screens/user_details_screen.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:network_image_mock/network_image_mock.dart';
import 'package:provider/provider.dart';

import 'bottom_navigation_test.mocks.dart';

@GenerateNiceMocks([
  MockSpec<UserRepository>(
      as: #MockUserRepository, onMissingStub: OnMissingStub.returnDefault)
])
void main() {
  group('Bottom Navigation test', () {
    testWidgets('BottomTabNavigation should show DashboardScreen by default',
        (WidgetTester tester) async {
      MockUserRepository mockUserRepository = MockUserRepository();

      await tester.pumpWidget(
        MultiProvider(
          providers: [
            ChangeNotifierProvider<UserRepository>.value(
                value: mockUserRepository),
          ],
          child: const MaterialApp(
            home: BottomTabNavigation(),
          ),
        ),
      );

      // Expect to see the DashboardScreen content on the screen
      expect(find.text('Welcome'), findsOneWidget);
    });

    testWidgets('BottomTabNavigation should show UserDetailsScreen when tapped',
        (WidgetTester tester) async {
      MockUserRepository mockUserRepository = MockUserRepository();
      when(mockUserRepository.currentUser).thenReturn(
          User(email: 'email', firstName: 'firstName', profileUrl: ''));

      await mockNetworkImagesFor(() => tester.pumpWidget(
            MultiProvider(
              providers: [
                ChangeNotifierProvider<UserRepository>.value(
                    value: mockUserRepository),
              ],
              child: const MaterialApp(
                home: BottomTabNavigation(),
              ),
            ),
          ));

      // Tap on the User Profile tab
      await tester.tap(find.text('User Profile'));
      await tester.pumpAndSettle();

      // Expect to see the UserDetailsScreen content on the screen
      expect(find.byType(UserDetailsScreen), findsOneWidget);
      expect(find.byIcon(Icons.camera),
          findsNothing); // Check that the camera button is not visible
    });

    testWidgets('BottomTabNavigation should show SettingsScreen when tapped',
        (WidgetTester tester) async {
      MockUserRepository mockUserRepository = MockUserRepository();
      await tester.pumpWidget(
        MultiProvider(
          providers: [
            ChangeNotifierProvider<UserRepository>.value(
                value: mockUserRepository),
          ],
          child: const MaterialApp(
            home: BottomTabNavigation(),
          ),
        ),
      );

      // Tap on the Settings tab
      await tester.tap(find.text('Settings'));
      await tester.pumpAndSettle();

      // Expect to see the SettingsScreen content on the screen
      expect(find.text('Settings Screen'), findsOneWidget);
    });

    testWidgets('BottomTabNavigation should show ChatScreen when tapped',
        (WidgetTester tester) async {
      MockUserRepository mockUserRepository = MockUserRepository();
      await tester.pumpWidget(
        MultiProvider(
          providers: [
            ChangeNotifierProvider<UserRepository>.value(
                value: mockUserRepository),
          ],
          child: const MaterialApp(
            home: BottomTabNavigation(),
          ),
        ),
      );

      // Tap on the Chats tab
      await tester.tap(find.text('Chats'));
      await tester.pumpAndSettle();

      // Expect to see the ChatScreen content on the screen
      expect(find.text('Chat Screen'), findsOneWidget);
    });
  });
}