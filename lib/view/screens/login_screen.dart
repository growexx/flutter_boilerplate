

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/app_manager/helper/navigation/navigation_helper.dart';
import 'package:flutter_boilerplate/app_manager/locale/widget/locale_selector_widget.dart';
import 'package:flutter_boilerplate/app_manager/theme/widget/theme_mode_selector.dart';
import 'package:flutter_boilerplate/view/screens/dashboard_screen.dart';

class LoginScreen extends StatefulWidget {

  static const String name = "login";
  static const String path = "/$name";

  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
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
                      setState(() {

                      });
                    },
                  )
                ],
          ),
             ),
           ),
          Expanded(
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text("login_screen").tr(),
                    const SizedBox(height: 20,),
                    TextButton(onPressed: (){
                      NavigationHelper.pushNamed(context,DashboardScreen.name);
                    }, child: const Text("go_to_dashboard",).tr())
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
