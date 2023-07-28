import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/view/screens/forgot_password/widget/forgot_password_widget.dart';

class ForgotPasswordScreen extends StatefulWidget {
  static const String name = "forgot_password";
  static const String path = "/$name";

  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: SingleChildScrollView(
                child: ForgotPasswordWidget(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
