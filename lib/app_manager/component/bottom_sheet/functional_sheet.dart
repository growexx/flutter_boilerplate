import 'package:flutter_boilerplate/app_manager/theme/components_theme/button_theme.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class FunctionalSheet extends StatelessWidget {
  final String message;
  final String buttonName;
  final Function onPressButton;
  final bool showCancelButton;
  final String cancelButtonTitle;
  final TextAlign? textAlign;

  const FunctionalSheet({
    Key? key,
    required this.message,
    required this.buttonName,
    required this.onPressButton,
    this.showCancelButton = true,
    this.textAlign,
    this.cancelButtonTitle = "CANCEL",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 40, 20, 20),
          child: Text(message.toString(),
              textAlign: textAlign ?? TextAlign.center,
              style: theme.textTheme.bodyLarge),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
          child: Row(
            children: [
              showCancelButton
                  ? Expanded(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                        child: TextButtonTheme(
                          data: CustomTextButtonTheme.grey,
                          child: TextButton(
                            key: const Key("cancel"),
                            onPressed: () {
                              try {
                                context.pop();
                              // ignore: empty_catches
                              } catch (e) {}
                            },
                            child:  Text(cancelButtonTitle),
                          ),
                        ),
                      ),
                    )
                  : Container(),
              Expanded(
                child: TextButtonTheme(
                  data: CustomTextButtonTheme.primary,
                  child: TextButton(
                    key: const Key("function"),
                    onPressed: () {
                      try {
                        context.pop();
                        onPressButton();
                      // ignore: empty_catches
                      } catch (e) {}
                    },
                    child: Text(buttonName.toUpperCase()),
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
