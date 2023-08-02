import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/app_manager/models/todo_data.dart';
import 'package:flutter_boilerplate/app_manager/service/navigation_service.dart';
import 'package:flutter_boilerplate/view/screens/todo/screen/todo_list_screen.dart';
import 'package:go_router/go_router.dart';
import 'package:hive/hive.dart';

class HiveModel extends ChangeNotifier {
  HiveModel() {
    getDataLists();
  }

  String hiveBox = "todo_db";

  final formKey = GlobalKey<FormState>();

  final List<dynamic> _todoList = [];

  set todoList(List<dynamic> data) {
    _todoList.addAll(data);
  }

  List<dynamic> get todoList => _todoList;

  bool _isLoading = false;
  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  bool get isLoading => _isLoading;

  void addData(TodoData data) async {
    var box = await Hive.openBox("todo_db"); //open the hive box before writing
    if (formKey.currentState!.validate()) {
      box.put(data.toJson()["list_id"], data.toJson());
      BuildContext? context = NavigationService.context;
      if (context != null) {
        // ignore: use_build_context_synchronously
        context.pushReplacementNamed(TodoListScreen.name);
      }
    }
    if (kDebugMode) {
      print((data.toString()));
    }

    Hive.close(); //closing the hive box
  }

  //Reading all the users data
  void getDataLists() async {
    isLoading = true;
    var box = await Hive.openBox(hiveBox);
    List<dynamic> todoData = [];

    for (int i = box.length - 1; i >= 0; i--) {
      var data = box.getAt(i);
      todoData.add(data);
      if (kDebugMode) {
        print((data.toString()));
      }
    }
    todoList = todoData;
    isLoading = false;
  }

  void deleteListData(String index) async {
    isLoading = true;
    var box = await Hive.openBox(hiveBox);
    box.delete(index);
    isLoading = false;
  }
}
