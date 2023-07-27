import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/app_manager/locale/widget/locale_selector_widget.dart';
import 'package:flutter_boilerplate/app_manager/theme/widget/theme_mode_selector.dart';
import 'package:flutter_boilerplate/view/widgets/login_widget.dart';
import 'package:flutter_boilerplate/view/widgets/signup_widget.dart';

class SignUpScreen extends StatefulWidget {
  static const String name = "signup";
  static const String path = "/$name";

  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Wrap(
                alignment: WrapAlignment.spaceAround,
                children: [
                  const ThemeModeSelector(),
                  LocaleSelectorWidget(
                    onLocaleChange: () {
                      setState(() {});
                    },
                  )
                ],
              ),
            ),
          ),
          const Expanded(
            child: Center(
              child: SingleChildScrollView(
                child: SignUpWidget(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
