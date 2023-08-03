import 'package:hive/hive.dart';
part 'todo_data.g.dart';

@HiveType(typeId: 1)
class TodoData {
  TodoData({this.listId, this.title, this.data,  this.dateTime, this.userId});
  @HiveField(0)
  String? listId;

  @HiveField(1)
  String? title;

  @HiveField(2)
  String? data;

  @HiveField(3)
  String? dateTime;

  @HiveField(4)
  String? userId;

  TodoData.fromJson(Map<String, dynamic> json) {
    listId = json['list_id'];
    title = json['title'];
    data = json['data'];
    dateTime = json['date_time'];
    userId = json['user_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['list_id'] = listId;
    data['title'] = title;
    data['data'] = this.data;
    data['date_time'] = dateTime;
    data['user_id'] = userId;
    return data;
  }
}
