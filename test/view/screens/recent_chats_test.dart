import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/authentication/user.dart';
import 'package:flutter_boilerplate/authentication/user_repository.dart';
import 'package:flutter_boilerplate/view/screens/components/message_tile.dart';
import 'package:flutter_boilerplate/view/screens/screens.dart';
import 'package:flutter_boilerplate/view_model/veiw_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:mockito/mockito.dart';
import 'package:network_image_mock/network_image_mock.dart';
import 'package:provider/provider.dart';

import '../../util/testing_material_app.dart';

class MockUserRepository extends Mock implements UserRepository {}

void main() {
  testWidgets('RecentChats widget displays user list',
      (WidgetTester tester) async {
    final chatViewModel = ChatViewModel(); // Mock or actual ViewModel
    final mockUserRepository = MockUserRepository();
    when(mockUserRepository.currentUser).thenReturn(User(id: 'user123'));
    await mockNetworkImagesFor(() async {
      await tester.pumpWidget(
        MaterialApp(
            home: MultiProvider(
          providers: [
            ChangeNotifierProvider<ChatViewModel>.value(
              value: chatViewModel,
            ),
            ChangeNotifierProvider<UserRepository>.value(
              value: mockUserRepository,
            ),
          ],
          child: const RecentChats(),
        )),
      );
    });

    // Verify that the widget displays the list of users
    expect(find.byType(Container), findsNWidgets(15)); // Number of sample users
    expect(
        find.byType(MessageTile), findsNWidgets(5)); // Number of message tiles
  });

  testWidgets('RecentChats widget displays user list when last message is ours',
      (WidgetTester tester) async {
    final chatViewModel = ChatViewModel(); // Mock or actual ViewModel
    final mockUserRepository = MockUserRepository();
    when(mockUserRepository.currentUser).thenReturn(User(id: 'user123'));
    await mockNetworkImagesFor(() async {
      await tester.pumpWidget(
        MaterialApp(
            home: MultiProvider(
          providers: [
            ChangeNotifierProvider<ChatViewModel>.value(
              value: chatViewModel,
            ),
            ChangeNotifierProvider<UserRepository>.value(
              value: mockUserRepository,
            ),
          ],
          child: const RecentChats(),
        )),
      );
    });

    // Verify that the widget displays the list of users
    expect(find.byType(Container), findsNWidgets(15)); // Number of sample users
    expect(
        find.byType(MessageTile), findsNWidgets(5)); // Number of message tiles
  });

  testWidgets('Tap on a user triggers recent chat click',
      (WidgetTester tester) async {
    final chatViewModel = ChatViewModel(); // Mock or actual ViewModel
    await mockNetworkImagesFor(() async {
      await tester.pumpWidget(
          testingMaterial(
        initialLocation: RecentChats.path,
        routesData: [
          GoRoute(
            path: RecentChats.path,
            builder: (context, state) => MultiProvider(
              providers: [
                ChangeNotifierProvider<ChatViewModel>.value(
                  value: chatViewModel,
                ),
                ChangeNotifierProvider<UserRepository>.value(
                  value: UserRepository(
                      currentUser: User(
                          id: "1",
                          firstName: "meet",
                          lastName: "patel",
                          profileUrl: 'http://abc.com')),
                ),
              ],
              child: const RecentChats(),
            ),
          ),
          GoRoute(
            path: ChatScreen.path,
            name: ChatScreen.name,
            builder: (context, state) => const ChatScreen(),
          ),
        ],
      ));
    });

    // Tap on the first user's message tile
    await tester.tap(find.byKey(const Key('message-tile')).last);
  });
}
