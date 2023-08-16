import 'package:flutter_boilerplate/models/chat_user.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Convert Chat User to JSON', () {
    final chatUser = ChatUser(
            email: 'test@test.com',
            userStatus: 'active',
            chatWith: 'chatWith',
            name: 'John Doe',
            userId: '123')
        .toJson();
    expect(chatUser.isNotEmpty, true);
  });
  test('Convert Chat User from JSON', () {
    final testMessage = ChatUser.fromJson({
      'email': 'test@test.com',
      'userStatus': 'active',
      'chatWith': 'chatWith',
      'name': 'John Doe',
      'userId': '123',
    });
    expect(testMessage.email.isNotEmpty, true);
  });
}
