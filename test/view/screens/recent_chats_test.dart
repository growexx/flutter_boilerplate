import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/authentication/user.dart';
import 'package:flutter_boilerplate/authentication/user_repository.dart';
import 'package:flutter_boilerplate/view/screens/components/message_tile.dart';
import 'package:flutter_boilerplate/view/screens/screens.dart';
import 'package:flutter_boilerplate/view_model/veiw_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:network_image_mock/network_image_mock.dart';
import 'package:provider/provider.dart';

class MockUserRepository extends Mock implements UserRepository {
  @override
  User? get currentUser => User(id: '123');
}

void main() {
  testWidgets('RecentChats widget displays user list',
      (WidgetTester tester) async {
    final chatViewModel = ChatViewModel(); // Mock or actual ViewModel
    final mockUserRepository = MockUserRepository();
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
    final mockUserRepository = MockUserRepository();
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

    // Tap on the first user's message tile
    await tester.tap(find.byType(MessageTile).first);
    await tester.pump();
  });
}
