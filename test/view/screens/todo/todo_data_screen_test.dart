import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/app_manager/constant/app_constant.dart';
import 'package:flutter_boilerplate/view/screens/todo/screen/todo_data_screen.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../../util/common_initial_activity.dart';
import '../../../util/testing_material_app.dart';

void main() async {
  await commonInitialActivity();
  setUpAll(() async {
    Hive.init(Directory.systemTemp.path);
  });
  Widget widget = testingMaterial(initialLocation: AddEditTodoScreen.path);

  testWidgets(
    "add-edit-todo-screen is available",
    (WidgetTester tester) async {
      tester.runAsync(() => Hive.openBox(AppConstant.hiveDB));
      await tester.pumpWidget(widget);
      expect(find.text("New Task"), findsOneWidget);
      expect(find.text("Task"), findsOneWidget);
      expect(find.text("Description"), findsOneWidget);
    },
  );
  testWidgets(
    "textformfiels are availabe",
    (WidgetTester tester) async {
      tester.runAsync(() => Hive.openBox(AppConstant.hiveDB));
      await tester.pumpWidget(widget);
      expect(find.byType(TextFormField), findsNWidgets(2));
      await tester.enterText(find.byKey(const Key("task")), 'test');
      await tester.testTextInput.receiveAction(TextInputAction.done);
      await tester.enterText(find.byKey(const Key("description")), 'Test data');
      await tester.testTextInput.receiveAction(TextInputAction.done);
      expect(find.byType(ElevatedButton), findsNWidgets(2));
      await tester.tap(find.byType(ElevatedButton).last);
      await tester.tap(find.byType(ElevatedButton).first);
    },
  );

  tearDownAll(() async {
    await Hive.close();
  });
}
