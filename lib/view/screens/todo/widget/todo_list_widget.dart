import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/models/todo_data.dart';
import 'package:flutter_boilerplate/view/screens/todo/screen/todo_data_screen.dart';
import 'package:flutter_boilerplate/view_model/hive_view_model.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class TodoListWidget extends StatelessWidget {
  const TodoListWidget({super.key, required this.data});
  final TodoData data;
  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<HiveModel>(context, listen: false);

    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 800),
        child: Card(
          child: Wrap(
            children: [
              SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListTile(
                        title: Text(
                          data.title,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Text(
                          data.data,
                          style: const TextStyle(
                            fontSize: 14,
                          ),
                        ),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              onPressed: () {
                                context.pushNamed(AddEditTodoScreen.name,
                                    extra: data);
                              },
                              icon: const Icon(Icons.edit),
                            ),
                            IconButton(
                              onPressed: () {
                                viewModel.deleteListData(data.listId);
                              },
                              icon: const Icon(Icons.delete_forever),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 8.0),
                        child: Text(
                          'Last Updated at: ${data.dateTime}',
                          style: const TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
