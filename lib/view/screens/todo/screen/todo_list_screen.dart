import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/view/screens/todo/screen/todo_data_screen.dart';
import 'package:flutter_boilerplate/view/screens/todo/widget/todo_list_widget.dart';
import 'package:flutter_boilerplate/view_model/hive_view_model.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../dashboard/dashboard_screen.dart';

class TodoListScreen extends StatelessWidget {
  static const String name = "todo-list";
  static const String path = "/$name";

  const TodoListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<HiveModel>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              context.goNamed(DashboardScreen.name);
            },
            icon: const Icon(Icons.arrow_back_sharp)),
        title: const Text("todo_list").tr(),
        automaticallyImplyLeading: true,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        onPressed: () {
          context.goNamed(AddEditTodoScreen.name);
        },
        child: const Icon(Icons.add),
      ),
      body: Selector<HiveModel, List<dynamic>>(
        shouldRebuild: (previous, next) => true,
        selector: (context, viewModel) => viewModel.todoList,
        builder: (context, todoList, child) {
          return viewModel.isLoading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : todoList.isEmpty
                  ? Center(
                      child: const Text("empty_note").tr(),
                    )
                  : ListView.builder(
                      shrinkWrap: true,
                      itemCount: todoList.length,
                      itemBuilder: (BuildContext context, int index) {
                        return TodoListWidget(
                          data: todoList[index],
                        );
                      },
                    );
        },
      ),
    );
  }
}
