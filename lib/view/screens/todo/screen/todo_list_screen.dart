import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/view/screens/todo/screen/todo_data_screen.dart';
import 'package:flutter_boilerplate/view/screens/todo/widget/todo_list_widget.dart';
import 'package:flutter_boilerplate/view_model/hive_view_model.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class TodoListScreen extends StatelessWidget {
  static const String name = "todo-list";
  static const String path = "/$name";

  const TodoListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<HiveModel>(context,listen: false);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Todo List"),
        automaticallyImplyLeading: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.pushReplacementNamed(AddTodoDataScreen.name);
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
                  ? const Center(
                      child: Text("Please Add Notes"),
                    )
                  : GridView.builder(
                      itemCount: todoList.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                      ),
                      itemBuilder: (context, index) {
                        return TodoListWidget(
                          data: todoList[index],
                          index: index,
                        );
                      },
                    );
        },
      ),
    );
  }
}
