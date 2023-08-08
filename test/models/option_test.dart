import 'package:flutter_boilerplate/models/option.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
   Map<String, dynamic> dummyData = {
   "title":"test",
   "value":"10",
  };

  test(
    "model testing",
    () {
      Option object = Option.fromJson(dummyData);
      Map<String, dynamic> json = object.toJson();
      expect(object.title, "test");
      expect(json.isNotEmpty, true);
      Option data = Option(value: "10");
      expect(data.value, "10");
    },
  );
}