
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/app_manager/component/responsive/widget/responsive_helper.dart';
import 'package:flutter_boilerplate/app_manager/helper/validation_helper.dart';
import 'package:flutter_boilerplate/models/todo_data.dart';
import 'package:flutter_boilerplate/view/screens/todo/screen/todo_list_screen.dart';
import 'package:flutter_boilerplate/view_model/hive_view_model.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

class AddEditTodoScreen extends StatelessWidget {
  static const String name = "add-edit-todo-data";
  static const String path = "/$name";
  const AddEditTodoScreen({super.key, this.data});
  final TodoData? data;
  @override
  Widget build(BuildContext context) {
  final TextEditingController titleController = TextEditingController(text: data?.title ?? "" );
  final TextEditingController dataController = TextEditingController(text: data?.data ?? "" );
    titleController.selection = TextSelection.fromPosition(
        TextPosition(offset: titleController.text.length));

    dataController.selection = TextSelection.fromPosition(
        TextPosition(offset: dataController.text.length));
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    HiveModel viewModel = Provider.of<HiveModel>(context, listen: false);
    Widget inputWidget = AlertDialog(
      scrollable: true,
      title: Column(
        children: [
          const Text(
            'new_task',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16, color: Colors.brown),
          ).tr(),
          Text(data?.dateTime ?? DateFormat.yMMMMd('en_US').add_jm().format(DateTime.now()),
              style: const TextStyle(fontSize: 16, color: Colors.brown)),
        ],
      ),
      content: SizedBox(
        height: height * 0.45,
        width: width,
        child: Form(
          key: viewModel.formKey,
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                TextFormField(
                  key: const Key("task"),
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
                  key: const Key("description"),
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
      ),
      actions: [
        ElevatedButton(
          key: const Key("cancel"),
          onPressed: () {
            context.pushNamed(TodoListScreen.name);
          },
          child: const Text('cancel').tr(),
        ),
        ElevatedButton(
          key: const Key("save"),
          onPressed: () {
            const uuid = Uuid();
            viewModel.saveData(TodoData(
                listId: data?.listId ?? uuid.v4(),
                title: titleController.text.trim(),
                data: dataController.text.trim(),
                dateTime: DateFormat.yMMMMd('en_US').add_jm().format(
                      DateTime.now(),
                    ),
                userId: '1'));
            //replace user id with user token in future...
          },
          child: const Text('save').tr(),
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
