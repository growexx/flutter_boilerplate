import 'package:flutter_boilerplate/view_model/chat_view_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test(
    "Chat ViewModel Test",
    () {
      final model = ChatViewModel();
      model.usersClickListener();
      model.getChatId();
      model.updateLastMessage(
          chatId: '123',
          senderId: 'senderId',
          receiverId: 'receiverId',
          receiverUsername: 'receiverUsername',
          msgTime: 'msgTime',
          msgType: 'msgType',
          message: 'message',
          context: 'context');
      model.lastMessageForCurrentUser();
      model.lastMessageForPeerUser();
    },
  );
}
