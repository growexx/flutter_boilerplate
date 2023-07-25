

import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {

  static const String name = "login";
  static const String path = "/$name";

  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Login Screen"),
      ),
    );
  }
}
