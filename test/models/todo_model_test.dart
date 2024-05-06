import 'package:flutter_boilerplate/models/todo_data.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  Map<String, dynamic> dummyData = {
    "list_id": "1",
    "title": "test",
    "data": "test data",
    "date_time": "12/2/2023",
    "user_id": "1"
  };

  test(
    "model testing",
        () {
      TodoData object = TodoData.fromJson(dummyData);
      Map<dynamic, dynamic> json = object.toJson();
      expect(object.title, "test");
      expect(json.isNotEmpty, true);
      TodoData data = TodoData( listId: "1",
          title: "test",
          data: "test data",
          dateTime: "12/2/2023",
          userId: "1");
      expect(data.userId, "1");
    },
  );
}