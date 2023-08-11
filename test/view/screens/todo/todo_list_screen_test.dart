import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/app_manager/constant/app_constant.dart';
import 'package:flutter_boilerplate/models/todo_data.dart';
import 'package:flutter_boilerplate/view/screens/todo/screen/todo_list_screen.dart';
import 'package:flutter_boilerplate/view_model/hive_view_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';

import '../../../util/common_initial_activity.dart';
import '../../../util/testing_material_app.dart';

void main() async {
  await commonInitialActivity();
  setUpAll(() async {
    Hive.init(Directory.systemTemp.path);
  });
  testWidgets(
    "todo_list_screen is available",
    (WidgetTester tester) async {
      tester.runAsync(() => Hive.openBox(AppConstant.hiveDB));
      await tester
          .pumpWidget(testingMaterial(initialLocation: TodoListScreen.path));
      expect(find.text("Todo List"), findsOneWidget);
      expect(find.byType(FloatingActionButton), findsOneWidget);
      await tester.tap(find.byType(FloatingActionButton));
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
      await tester.tap(find.byIcon(Icons.arrow_back_sharp));
    },
  );
  testWidgets(
    "todo_list_screen test case for list view",
    (WidgetTester tester) async {
      tester.runAsync(() => Hive.openBox(AppConstant.hiveDB));
      await tester
          .pumpWidget(testingMaterial(initialLocation: TodoListScreen.path));
      // expect(find.text("Todo List"), findsOneWidget);
      final model = HiveModel();
      model.todoList = [
        TodoData(
            listId: "test",
            title: "test data",
            data: "test",
            dateTime: "12/2/23",
            userId: "1")
      ];
      await model.getDataLists();
      await tester.pump();
      expect(find.byType(ListView), findsOneWidget);
    },
  );
  tearDownAll(() async {
    await Hive.close();
  });
}
