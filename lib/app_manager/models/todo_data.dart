import 'package:hive/hive.dart';
part 'todo_data.g.dart';

@HiveType(typeId: 1)
class TodoData {
  TodoData({required this.listId, required this.title, required this.data, required this.dateTime, required this.userId});
  @HiveField(0)
  String listId;

  @HiveField(1)
  String title;

  @HiveField(2)
  String data;

  @HiveField(3)
  String dateTime;

  @HiveField(4)
  String userId;

  TodoData.fromJson(Map<String, dynamic> json, this.listId, this.title, this.data, this.dateTime, this.userId) {
    listId = json['list_id'];
    title = json['title'];
    data = json['data'];
    dateTime = json['dateTime'];
    userId = json['user_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['list_id'] = listId;
    data['title'] = title;
    data['data'] = this.data;
    data['dateTime'] = dateTime;
    data['user_id'] = userId;
    return data;
  }
}
