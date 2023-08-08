import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/models/chat_user.dart';
import 'package:flutter_boilerplate/models/message.dart';
import 'package:flutter_boilerplate/view_model/chat_view_model.dart';
import 'package:provider/provider.dart';

import '../components/message_tile.dart';

class RecentChats extends StatefulWidget {
  static const String name = "recent-chats";
  static const String path = "/$name";
  final bool autoShowBackButton;
  const RecentChats({Key? key, this.autoShowBackButton = true})
      : super(key: key);

  @override
  State<RecentChats> createState() => _RecentChatsState();
}

class _RecentChatsState extends State<RecentChats> {
  ChatViewModel chatViewModel = ChatViewModel();

  List<ChatUser> sampleUsers = [
    ChatUser(
      photoUrl: 'https://example.com/user1.png',
      email: 'user1@example.com',
      userStatus: 'Online',
      chatWith: 'user2@example.com',
      name: 'User 1',
      userId: 'user1',
    ),
    ChatUser(
      photoUrl: 'https://example.com/user2.png',
      email: 'user2@example.com',
      userStatus: 'Online',
      chatWith: 'user1@example.com',
      name: 'User 2',
      userId: 'user2',
    ),
    ChatUser(
      photoUrl: 'https://example.com/user3.png',
      email: 'user3@example.com',
      userStatus: 'Offline',
      chatWith: 'user4@example.com',
      name: 'User 3',
      userId: 'user3',
    ),
    ChatUser(
      photoUrl: 'https://example.com/user4.png',
      email: 'user4@example.com',
      userStatus: 'Online',
      chatWith: 'user3@example.com',
      name: 'User 4',
      userId: 'user4',
    ),
    ChatUser(
      photoUrl: 'https://example.com/user5.png',
      email: 'user5@example.com',
      userStatus: 'Online',
      chatWith: 'user1@example.com',
      name: 'User 5',
      userId: 'user5',
    ),
  ];

  List<Message> messages = [
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
        messageSenderId: "user123",
        messageReceiverId: "user456",
        msgTime: DateTime.now(),
        msgType: "text",
        message: "Hello, how are you?"),
    Message(
        chatId: "chatId3",
        messageFrom: "John Doe",
        messageTo: "Jane Smith",
        messageSenderId: "user123",
        messageReceiverId: "user456",
        msgTime: DateTime.now(),
        msgType: "text",
        message: "Hello, how are you?"),
    Message(
        chatId: "chatId4",
        messageFrom: "John Doe",
        messageTo: "Jane Smith",
        messageSenderId: "user123",
        messageReceiverId: "user456",
        msgTime: DateTime.now(),
        msgType: "text",
        message: "Hello, how are you?"),
    Message(
        chatId: "chatId5",
        messageFrom: "John Doe",
        messageTo: "Jane Smith",
        messageSenderId: "user123",
        messageReceiverId: "user456",
        msgTime: DateTime.now(),
        msgType: "text",
        message: "Hello, how are you?"),
  ];

  @override
  void initState() {
    chatViewModel = Provider.of<ChatViewModel>(context, listen: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ChatViewModel>(
      builder: (context, chatViewModel, child) => Scaffold(
        appBar: AppBar(
          title: const Text("Recent Chats"),
          automaticallyImplyLeading: widget.autoShowBackButton,
        ),
        body: Column(
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(5.0),
                    topRight: Radius.circular(5.0)),
                child: ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  itemCount: sampleUsers.length,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (BuildContext context, int index) {
                    String tempUrl = "";
                    // log("tempUrl is $tempUrl");
                    return Container(
                      margin: const EdgeInsets.symmetric(vertical: 5),
                      child: Row(
                        children: [
                          Container(
                              height: 60,
                              width: 60,
                              clipBehavior: Clip.hardEdge,
                              decoration: BoxDecoration(
                                  color: Colors.amber,
                                  borderRadius: BorderRadius.circular(100)),
                              child: tempUrl == ""
                                  ? Image.network(ChatUser.avatarUrl)
                                  : Image.network(
                                      tempUrl.toString(),
                                      fit: BoxFit.fill,
                                      loadingBuilder:
                                          (context, child, loadingProgress) {
                                        if (loadingProgress == null) {
                                          return child;
                                        }
                                        return Center(
                                          child: CircularProgressIndicator(
                                            value: loadingProgress
                                                        .expectedTotalBytes !=
                                                    null
                                                ? loadingProgress
                                                        .cumulativeBytesLoaded /
                                                    loadingProgress
                                                        .expectedTotalBytes!
                                                : null,
                                            strokeWidth: 5,
                                            color: Colors.black,
                                          ),
                                        );
                                      },
                                    )),
                          Expanded(
                            child: InkWell(
                              onTap: () {
                                chatViewModel.recentChatClickListener(context);
                              },
                              child: MessageTile(messages[index]),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
