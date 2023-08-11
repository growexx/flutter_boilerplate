import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/app_manager/helper/navigation/navigation_helper.dart';
import 'package:flutter_boilerplate/models/message.dart';
import 'package:flutter_boilerplate/view/screens/chat/chat_screen.dart';
import '../models/chat_user.dart';

class ChatViewModel with ChangeNotifier {
  // QueryDocumentSnapshot<Object?>? peerUserData;
  late ChatUser currentUser;
  final List<Message> _messageList = [
    Message(
        chatId: "chatId1",
        messageFrom: "John Doe",
        messageTo: "Jane Smith",
        messageSenderId: "user123",
        messageReceiverId: "user456",
        msgTime: DateTime.now(),
        msgType: "text",
        message: "Hello, how are you?"),
    Message(
        chatId: "chatId2",
        messageFrom: "John Doe",
        messageTo: "Jane Smith",
        messageSenderId: "user456",
        messageReceiverId: "user123",
        msgTime: DateTime.now(),
        msgType: "text",
        message: "I am Fine, how are you?"),
    Message(
        chatId: "chatId3",
        messageFrom: "John Doe",
        messageTo: "Jane Smith",
        messageSenderId: "user123",
        messageReceiverId: "user456",
        msgTime: DateTime.now(),
        msgType: "text",
        message: "Hello again"),
    Message(
        chatId: "chatId4",
        messageFrom: "John Doe",
        messageTo: "Jane Smith",
        messageSenderId: "user456",
        messageReceiverId: "user123",
        msgTime: DateTime.now(),
        msgType: "text",
        message: "Hello, 2"),
    Message(
        chatId: "chatId5",
        messageFrom: "John Doe",
        messageTo: "Jane Smith",
        messageSenderId: "user123",
        messageReceiverId: "user456",
        msgTime: DateTime.now(),
        msgType: "text",
        message: "Hello, 3"),
    Message(
        chatId: "chatId6",
        messageFrom: "John Doe",
        messageTo: "Jane Smith",
        messageSenderId: "user456",
        messageReceiverId: "user123",
        msgTime: DateTime.now(),
        msgType: "text",
        message: "Hello, 4"),
    Message(
        chatId: "chatId7",
        messageFrom: "John Doe",
        messageTo: "Jane Smith",
        messageSenderId: "user123",
        messageReceiverId: "user456",
        msgTime: DateTime.now(),
        msgType: "text",
        message: "Hello, 5"),
    Message(
        chatId: "chatId8",
        messageFrom: "John Doe",
        messageTo: "Jane Smith",
        messageSenderId: "user456",
        messageReceiverId: "user123",
        msgTime: DateTime.now(),
        msgType: "text",
        message: "Hello, 6"),
    Message(
        chatId: "chatId9",
        messageFrom: "John Doe",
        messageTo: "Jane Smith",
        messageSenderId: "user123",
        messageReceiverId: "user456",
        msgTime: DateTime.now(),
        msgType: "text",
        message: "Hello, 7"),
    Message(
        chatId: "chatId10",
        messageFrom: "John Doe",
        messageTo: "Jane Smith",
        messageSenderId: "user456",
        messageReceiverId: "user123",
        msgTime: DateTime.now(),
        msgType: "text",
        message: "Hello, 8"),
  ];

  List<Message> get messageList => _messageList;

  void usersClickListener() {
    //TODO: use this function to fetch data of the particular user when tapped on 'all users' screen
    notifyListeners();
  }

  void recentChatClickListener(BuildContext context) {
    //TODO: use this function to fetch data of the particular user from 'recent chats' screen
    NavigationHelper.pushNamed(context, ChatScreen.name);
  }

  String getChatId() {
    //TODO: generate a chatId for a particular chat
    return '';
  }

  void updateLastMessage(
      {required chatId,
      required senderId,
      required receiverId,
      required receiverUsername,
      required msgTime,
      required msgType,
      required message,
      required context}) {
    //TODO: update last message of both currentUser and peerUser
    lastMessageForCurrentUser(
        receiverId: receiverId,
        senderId: senderId,
        chatId: chatId,
        context: context,
        receiverUsername: receiverUsername,
        msgTime: msgTime,
        msgType: msgType,
        message: message);
    lastMessageForPeerUser(
        receiverId: receiverId,
        senderId: senderId,
        chatId: chatId,
        context: context,
        receiverUsername: receiverUsername,
        msgTime: msgTime,
        msgType: msgType,
        message: message);
  }

  void lastMessageForCurrentUser(
      {receiverId,
      senderId,
      chatId,
      context,
      receiverUsername,
      msgTime,
      msgType,
      message}) {
    //TODO: update last message for current user
  }

  void lastMessageForPeerUser(
      {receiverId,
      senderId,
      chatId,
      context,
      receiverUsername,
      msgTime,
      msgType,
      message}) {
    //TODO: update last message for peer user
  }

  void addChatToList(String message) {
    _messageList.add(Message(
        chatId: (messageList.length + 1).toString(),
        messageFrom: "John Doe",
        messageTo: "John Smith",
        messageSenderId: 'user123',
        messageReceiverId: "user456",
        msgTime: DateTime.now(),
        msgType: "text",
        message: message));
    notifyListeners();
  }
}
