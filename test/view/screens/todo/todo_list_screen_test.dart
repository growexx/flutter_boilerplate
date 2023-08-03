import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/app_manager/constant/app_constant.dart';
import 'package:flutter_boilerplate/view/screens/todo/screen/todo_list_screen.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';

import '../../../util/common_initial_activity.dart';
import '../../../util/testing_material_app.dart';

void main() async {
  await commonInitialActivity();
  setUpAll(() async {
    Hive.init(Directory.systemTemp.path);
  });
  Widget widget = testingMaterial(initialLocation: TodoListScreen.path);
  testWidgets(
    "todo_list_screen is available",
    (WidgetTester tester) async {
      tester.runAsync(() => Hive.openBox(AppConstant.hiveDB));
      await tester.pumpWidget(widget);
      expect(find.text("Todo List"), findsOneWidget);
      expect(find.byType(FloatingActionButton), findsOneWidget);
      await tester.tap(find.byType(FloatingActionButton));
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    },
  );
}
