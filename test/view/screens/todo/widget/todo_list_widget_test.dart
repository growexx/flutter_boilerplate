import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/app_manager/models/todo_data.dart';
import 'package:flutter_boilerplate/view/screens/todo/widget/todo_list_widget.dart';
import 'package:flutter_boilerplate/view_model/hive_view_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';

import '../../../../util/common_initial_activity.dart';

void main() async {
  await commonInitialActivity();
  setUpAll(() async {
    Hive.init(Directory.systemTemp.path);
  });
  testWidgets(
    "todo list widget testing is done",
    (WidgetTester tester) async {
      await tester.pumpWidget(ChangeNotifierProvider(
        create: (context) => HiveModel(),
        child: MaterialApp(
          home: TodoListWidget(
              data: TodoData(
                  listId: "1",
                  title: "test",
                  data: "test data",
                  dateTime: "12/2/23",
                  userId: "1")),
        ),
      ));
      await tester.pump();
      expect(find.text("test"), findsOneWidget);
      expect(find.text("test data"), findsOneWidget);
      await tester.tap(find.byIcon(Icons.delete_forever));
    },
  );
  tearDownAll(() async {
    await Hive.close();
  });
}
