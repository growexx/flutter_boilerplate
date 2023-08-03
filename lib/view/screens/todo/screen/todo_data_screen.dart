
import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/app_manager/component/responsive/widget/responsive_helper.dart';
import 'package:flutter_boilerplate/app_manager/helper/validation_helper.dart';
import 'package:flutter_boilerplate/app_manager/models/todo_data.dart';
import 'package:flutter_boilerplate/view_model/hive_view_model.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

class AddTodoDataScreen extends StatelessWidget {
  static const String name = "add-todo-data";
  static const String path = "/$name";
  const AddTodoDataScreen({super.key, this.data});
  final TodoData? data;
  @override
  Widget build(BuildContext context) {
  final TextEditingController titleController = TextEditingController(text: data?.title ?? "" );
  final TextEditingController dataController = TextEditingController(text: data?.data ?? "" );
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    HiveModel viewModel = Provider.of<HiveModel>(context, listen: false);
    Widget inputWidget = AlertDialog(
      scrollable: true,
      title: Column(
        children: [
          const Text(
            'New Task',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16, color: Colors.brown),
          ),
          Text(data?.dateTime ?? DateFormat.yMMMMd('en_US').add_jm().format(DateTime.now()),
              style: const TextStyle(fontSize: 16, color: Colors.brown)),
        ],
      ),
      content: SizedBox(
        height: height * 0.45,
        width: width,
        child: Form(
          key: viewModel.formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                controller: titleController,
                style: const TextStyle(fontSize: 14),
                validator: (value) {
                  return ValidationHelper.requiredField(value);
                },
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 20,
                  ),
                  hintText: 'Task',
                  hintStyle: const TextStyle(fontSize: 14),
                  icon: const Icon(Icons.edit_document, color: Colors.brown),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              TextFormField(
                controller: dataController,
                maxLength: 1000,
                maxLines: 10,
                keyboardType: TextInputType.multiline,
                style: const TextStyle(fontSize: 14),
                validator: (value) {
                  return ValidationHelper.requiredField(value);
                },
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 20,
                  ),
                  hintText: 'Description',
                  hintStyle: const TextStyle(fontSize: 14),
                  icon: const Icon(Icons.chat_bubble_outline,
                      color: Colors.brown),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
              const SizedBox(height: 15),
            ],
          ),
        ),
      ),
      actions: [
        ElevatedButton(
          onPressed: () {
            context.pop();
          },
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: () {
            const uuid = Uuid();

            viewModel.addData(TodoData(
                listId: data?.listId ?? uuid.v4(),
                title: titleController.text.trim(),
                data: dataController.text.trim(),
                dateTime: DateFormat.yMMMMd('en_US').add_jm().format(
                      DateTime.now(),
                    ),
                userId: '1'));
          },
          child: const Text('Save'),
        ),
      ],
    );

    return Scaffold(
      body: ResponsiveHelperWidget(
        mobile: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                inputWidget,
              ],
            ),
          ),
        ),
        desktop: Center(
          child: Container(
              alignment: Alignment.center,
              height: 800,
              width: 800,
              child: inputWidget),
        ),
      ),
    );
  }
}
