import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/models/chat_user.dart';
import 'package:provider/provider.dart';

import '../../../view_model/chat_view_model.dart';

class ChatScreen extends StatelessWidget {
  static const String name = "chat-screen";
  static const String path = "/$name";

  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    final scrollController = ScrollController();
    return Consumer<ChatViewModel>(
      builder: (context, chatViewModel, child) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Chat', style: theme.textTheme.headlineSmall),
          ),
          body: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  controller: scrollController,
                  itemCount: chatViewModel.messageList
                      .length, // Replace this with the actual number of messages
                  itemBuilder: (context, index) {
                    // Replace this with your message widget
                    final message = chatViewModel.messageList[index];
                    return MessageBubble(
                      message: message.message,
                      isMe: message.messageSenderId ==
                          "user123", // Just for demonstration, change this based on the user
                    );
                  },
                ),
              ),
              MessageInputField(scrollController: scrollController),
            ],
          ),
        );
      },
    );
  }
}

class MessageBubble extends StatelessWidget {
  final String message;
  final bool isMe;

  const MessageBubble({super.key, required this.message, required this.isMe});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Row(
        mainAxisAlignment:
            isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          if (!isMe)
            CircleAvatar(
              radius: 17.0,
              backgroundImage: NetworkImage(ChatUser.avatarUrl),
            ),
          const Padding(padding: EdgeInsets.only(right: 3.0)),
          Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
            decoration: BoxDecoration(
              color: isMe ? Colors.blue : Colors.grey[300],
              borderRadius: BorderRadius.only(
                topLeft: isMe ? const Radius.circular(12.0) : Radius.zero,
                topRight: const Radius.circular(12.0),
                bottomLeft: const Radius.circular(12.0),
                bottomRight: isMe ? Radius.zero : const Radius.circular(12.0),
              ),
            ),
            child: Text(
              message,
              style: TextStyle(color: isMe ? Colors.white : Colors.black),
            ),
          ),
          const Padding(padding: EdgeInsets.only(right: 3.0)),
          if (isMe)
            CircleAvatar(
              radius: 17.0,
              backgroundImage: NetworkImage(ChatUser.avatarUrl),
            )
        ],
      ),
    );
  }
}

class MessageInputField extends StatelessWidget {
  final ScrollController scrollController;
  const MessageInputField({super.key, required this.scrollController});

  @override
  Widget build(BuildContext context) {
    final messageTextController = TextEditingController();
    return Consumer<ChatViewModel>(
      builder: (context, chatViewModel, child) {
        return Container(
          padding: const EdgeInsets.all(8.0),
          color: Colors.grey[200],
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  key: const Key('message-text-field'),
                  onTap: () async {
                    await Future.delayed(const Duration(milliseconds: 500));
                    scrollToLastElement();
                  },
                  controller: messageTextController,
                  onSubmitted: (value) {
                    if (value.isNotEmpty) {
                      chatViewModel.addChatToList(value);
                      messageTextController.clear();
                      scrollToLastElement();
                    }
                  },
                  decoration: InputDecoration(
                    hintText: 'Type your message...',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 8.0),
              IconButton(
                icon: const Icon(Icons.send),
                onPressed: () {
                  if (messageTextController.text.isNotEmpty) {
                    chatViewModel.addChatToList(messageTextController.text);
                    messageTextController.clear();
                    scrollToLastElement();
                  }
                  // Handle send message logic here
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void scrollToLastElement() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      scrollController.animateTo(
        scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeOut,
      );
    });
  }
}
