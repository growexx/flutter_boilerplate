class ChatUser {
  static String avatarUrl =
      "https://cdn-icons-png.flaticon.com/512/149/149071.png";
  
  ChatUser({
    this.photoUrl,
    required this.email,
    required this.userStatus,
    required this.chatWith,
    required this.name,
    required this.userId,
  });

  final String email;
  final String userStatus;
  final String chatWith;
  final String name;
  final String userId;
  final String? photoUrl;

  factory ChatUser.fromJson(Map<String, dynamic> json) => ChatUser(
        email: json["email"],
        userStatus: json["userStatus"],
        chatWith: json["chatWith"],
        name: json["name"],
        userId: json["userId"],
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "userStatus": userStatus,
        "chatWith": chatWith,
        "name": name,
        "userId": userId,
        "photoUrl": photoUrl,
      };
}
