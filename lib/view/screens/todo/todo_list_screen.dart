import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class TodoListScreen extends StatelessWidget {
  static const String name = "todo-list";
  static const String path = "/$name";

  const TodoListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Hello world"),
          automaticallyImplyLeading: true,
        ),
        body: ValueListenableBuilder(
          valueListenable: Hive.box('todo_db').listenable(),
          builder: (context, value, child) {
            return GridView.builder(
              itemCount: 6,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2),
              itemBuilder: (context, index) {
                return const Text("Hello");
              },
            );
          },
        ));
  }
}
