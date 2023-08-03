import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/view/screens/todo/screen/todo_data_screen.dart';
import 'package:flutter_boilerplate/view_model/hive_view_model.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class TodoListWidget extends StatelessWidget {
  const TodoListWidget({super.key, this.data, required this.index});
  final dynamic data;
  final int index;
  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<HiveModel>(context, listen: false);

    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(border: Border.all()),
        child: ListTile(
          title: Text(" Title : ${data["title"]}"),
          subtitle: Text("Data : ${data["data"]}"),
          trailing: IconButton(
              onPressed: () {
                viewModel.deleteListData(data["list_id"]);
              },
              icon: const Icon(Icons.delete_forever)),
              leading:   IconButton(
                onPressed: () {
                  context.pushNamed(AddTodoDataScreen.name , extra: data);
                },
                icon: const Icon(Icons.edit)),
        ),
      ),
    );
  }
}
