
import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/gen/assets.gen.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({super.key});

  static const String name = "error";
  static const String path = "/$name";

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Assets.png.error.image(
                  width: 333,
                  height: 270
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text("The page you are looking for does not exist",
                  textAlign: TextAlign.center,
                  style: theme.textTheme.titleMedium),
                ),
                SizedBox(
                  width: 166,
                  child: TextButton(
                    onPressed: () {

                    },
                    child: const Text("Return to home"),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}