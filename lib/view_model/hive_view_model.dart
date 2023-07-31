import 'package:flutter/foundation.dart';
import 'package:flutter_boilerplate/app_manager/models/todo_data.dart';
import 'package:hive/hive.dart';

class HiveModel extends ChangeNotifier {
  String hiveBox = "todo_db";
  void addData(TodoData data) async {
    var box = await Hive.openBox("todo_db"); //open the hive box before writing

    await box.add(TodoData(
        data: "meet",
        listId: "1",
        title: "Name",
        dateTime: "today",
        userId: "1"));
    TodoData data = box.get(12);
    print((data.toJson().toString()));

    Hive.close(); //closing the hive box
  }
}
