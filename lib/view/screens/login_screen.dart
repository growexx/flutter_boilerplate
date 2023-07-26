

import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/app_manager/theme/widget/theme_mode_selector.dart';

class LoginScreen extends StatelessWidget {

  static const String name = "login";
  static const String path = "/$name";

  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          ThemeModeSelector(),
          Expanded(
            child: Center(
              child: Text("Login Screen"),
            ),
          ),
        ],
      ),
    );
  }
}
