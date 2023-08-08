import 'package:flutter_boilerplate/models/message.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Convert Message to JSON', () {
    final testMessage = messageToJson(Message(
        chatId: '123',
        messageFrom: 'senderID',
        messageTo: 'receiverID',
        messageSenderId: 'messageSenderId',
        messageReceiverId: 'messageReceiverId',
        msgTime: DateTime.now(),
        msgType: 'message',
        message: 'Hello There'));
    expect(testMessage.isNotEmpty, true);
  });
  test('Convert Message from JSON', () {
    final testMessage = messageFromJson(
        '{"chatId":"123","messageFrom":"senderID","messageTo":"receiverID","messageSenderId":"messageSenderId","messageReceiverId":"messageReceiverId","msgTime":"2023-08-07T19:57:07.721343","msgType":"message","message":"Hello There"}');
    expect(testMessage.chatId.isNotEmpty, true);
  });
}
