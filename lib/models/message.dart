import 'dart:convert';

Message messageFromJson(String str) => Message.fromJson(json.decode(str));

String messageToJson(Message data) => json.encode(data.toJson());

class Message {
    String chatId;
    String messageFrom;
    String messageTo;
    String messageSenderId;
    String messageReceiverId;
    DateTime msgTime;
    String msgType;
    String message;

    Message({
        required this.chatId,
        required this.messageFrom,
        required this.messageTo,
        required this.messageSenderId,
        required this.messageReceiverId,
        required this.msgTime,
        required this.msgType,
        required this.message,
    });

    factory Message.fromJson(Map<String, dynamic> json) => Message(
        chatId: json["chatId"],
        messageFrom: json["messageFrom"],
        messageTo: json["messageTo"],
        messageSenderId: json["messageSenderId"],
        messageReceiverId: json["messageReceiverId"],
        msgTime: DateTime.parse(json["msgTime"]),
        msgType: json["msgType"],
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "chatId": chatId,
        "messageFrom": messageFrom,
        "messageTo": messageTo,
        "messageSenderId": messageSenderId,
        "messageReceiverId": messageReceiverId,
        "msgTime": msgTime.toIso8601String(),
        "msgType": msgType,
        "message": message,
    };
}
