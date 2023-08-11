import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/view/screens/components/message_tile.dart';
import 'package:flutter_boilerplate/view/screens/screens.dart';
import 'package:flutter_boilerplate/view_model/veiw_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

void main() {
  testWidgets('RecentChats widget displays user list', (WidgetTester tester) async {
    final chatViewModel = ChatViewModel(); // Mock or actual ViewModel

    await tester.pumpWidget(
      MaterialApp(
        home: ChangeNotifierProvider<ChatViewModel>.value(
          value: chatViewModel,
          child: const RecentChats(),
        ),
      ),
    );

    // Verify that the widget displays the list of users
    expect(find.byType(Container), findsNWidgets(5)); // Number of sample users
    expect(find.byType(MessageTile), findsNWidgets(5)); // Number of message tiles
  });

  testWidgets('Tap on a user triggers recent chat click', (WidgetTester tester) async {
    final chatViewModel = ChatViewModel(); // Mock or actual ViewModel

    await tester.pumpWidget(
      MaterialApp(
        home: ChangeNotifierProvider<ChatViewModel>.value(
          value: chatViewModel,
          child: const RecentChats(),
        ),
      ),
    );

    // Tap on the first user's message tile
    await tester.tap(find.byType(MessageTile).first);
    await tester.pump();
  });
}
