import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/app_manager/locale/widget/locale_selector_widget.dart';
import 'package:flutter_boilerplate/app_manager/theme/widget/theme_mode_selector.dart';
import 'package:flutter_boilerplate/view/widgets/change_password_widget.dart';
import 'package:flutter_boilerplate/view/widgets/login_widget.dart';

class ChangePasswordScreen extends StatefulWidget {
  static const String name = "change_password";
  static const String path = "/$name";

  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: SingleChildScrollView(
                child: ChangePasswordWidget(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
