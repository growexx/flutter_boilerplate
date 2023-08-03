import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/app_manager/helper/navigation/navigation_helper.dart';
import 'package:flutter_boilerplate/view/screens/chat/chat_screen.dart';
import '../models/chat_user.dart';

class ChatViewModel with ChangeNotifier {
  // QueryDocumentSnapshot<Object?>? peerUserData;
  late ChatUser currentUser;

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
}
