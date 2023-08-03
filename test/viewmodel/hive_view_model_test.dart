import 'dart:io';

import 'package:flutter_boilerplate/app_manager/models/todo_data.dart';
import 'package:flutter_boilerplate/view_model/hive_view_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';

void main() {
  test(
    "hive model test",
    () {
      Hive.init(Directory.systemTemp.path);
      final model = HiveModel();
      model.todoList = [
        TodoData(
            listId: "1",
            title: "test",
            data: "test data",
            dateTime: "12/2/2023",
            userId: "1")
      ];
      expect(model.todoList.isEmpty, false);
    },
  );
  test(
    "hive model test isloading",
    () {
      Hive.init(Directory.systemTemp.path);
      final model = HiveModel();
      model.isLoading = true;
      expect(model.isLoading, true);
    },
  );
  test(
    "hive model test delete method",
    () {
      Hive.init(Directory.systemTemp.path);
      final model = HiveModel();
      model.deleteListData("1");
    },
  );
}
