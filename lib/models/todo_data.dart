import 'package:hive/hive.dart';
part '../app_manager/models/todo_data.g.dart';

@HiveType(typeId: 1)
class TodoData {
  TodoData(
      {required this.listId,
      required this.title,
      required this.data,
      required this.dateTime,
      required this.userId});
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

  factory TodoData.fromJson(Map<dynamic, dynamic> json) {
    return TodoData(
        listId: json['list_id'],
        title: json['title'],
        data: json['data'],
        dateTime: json['date_time'],
        userId: json['user_id']);
  }

  Map<dynamic, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['list_id'] = listId;
    data['title'] = title;
    data['data'] = this.data;
    data['date_time'] = dateTime;
    data['user_id'] = userId;
    return data;
  }
}
