import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/app_manager/theme/theme_components/button_theme.dart';
import 'package:go_router/go_router.dart';

class AlertDialogView extends StatelessWidget {
  final String title;
  final String message;
  final String popButtonTitle;
  final String successButtonTitle;
  final Function onPressFunction;

  const AlertDialogView({
    Key? key,
    required this.title,
    required this.message,
    required this.popButtonTitle,
    required this.successButtonTitle,
    required this.onPressFunction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: Text(message),
      actions: <Widget>[
        TextButtonTheme(
          data: CustomTextButtonTheme.grey,
          child: TextButton(
            key: const Key("cancel"),
            onPressed: () {
              try {
                context.pop();
                // ignore: empty_catches
              } catch (e) {}
            },
            child: Text(popButtonTitle),
          ),
        ),
        TextButtonTheme(
          data: CustomTextButtonTheme.primaryLight,
          child: TextButton(
            key: const Key("function"),
            onPressed: () {
              try {
                context.pop();
                onPressFunction();
                // ignore: empty_catches
              } catch (e) {}
            },
            child: Text(successButtonTitle),
          ),
        )
      ],
    );
  }
}
