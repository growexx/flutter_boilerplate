import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/view/screens/chat/chat_screen.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Chat screen renders correctly', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: ChatScreen()));

    // Verify that the chat screen has an app bar with title 'Chat'
    expect(find.text('Chat'), findsOneWidget);

    // Verify that the message bubbles are being displayed
    expect(find.byType(MessageBubble), findsWidgets);

    // Verify that the message input field is displayed
    expect(find.byType(MessageInputField), findsOneWidget);
  });


  testWidgets('Sending a message triggers send message logic',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: ChatScreen()));

    // Find the message input field
    final messageInputField = find.byType(MessageInputField);
    expect(messageInputField, findsOneWidget);

    // Find the send button
    final sendButton = find.byIcon(Icons.send);
    expect(sendButton, findsOneWidget);

    // Tap the send button
    await tester.tap(sendButton);
    await tester.pump();

    // TODO: Add your logic to test the send message action
    // Verify that your send message logic has been triggered
  });
}
