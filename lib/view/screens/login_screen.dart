import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/app_manager/helper/navigation/navigation_helper.dart';
import 'package:flutter_boilerplate/app_manager/locale/widget/locale_selector_widget.dart';
import 'package:flutter_boilerplate/app_manager/theme/widget/theme_mode_selector.dart';
import 'package:flutter_boilerplate/view/screens/dashboard_screen.dart';
import 'package:flutter_boilerplate/view/widgets/input_decoration.dart';

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
    final theme = Theme.of(context);
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
          Expanded(
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text("login_screen").tr(),
                    const SizedBox(
                      height: 20,
                    ),
                    TextButton(
                        onPressed: () {
                          NavigationHelper.pushNamed(
                              context, DashboardScreen.name);
                        },
                        child: const Text(
                          "go_to_dashboard",
                        ).tr()),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      "login_capital",
                      style: theme.textTheme.headlineLarge,
                    ).tr(),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text("login_using_social_networks").tr(),
                    const SizedBox(height: 20),
                    Wrap(
                      children: [
                        Image.asset('assets/png/ic_facebook.png',
                            height: 40, width: 40),
                        const SizedBox(width: 20),
                        Image.asset('assets/png/ic_google.png',
                            height: 40, width: 40),
                        const SizedBox(width: 20),
                        Image.asset('assets/png/ic_linkedin.png',
                            height: 40, width: 40)
                      ],
                    ),
                    const SizedBox(height: 20),
                    const Text("or_capital").tr(),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: TextFormField(
                        key: const ValueKey("tff_email_address"),
                        decoration: buildInputDecoration(
                            "enter_email", "jaimin.modi@growexx.com", context),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: TextFormField(
                        key: const ValueKey("tff_password"),
                        obscureText: true,
                        decoration:
                            buildInputDecoration("enter_password", "", context),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 50, vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                      ),
                      child: const Text("sign_in").tr(),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const Text("remember_me").tr(),
                        Wrap(
                          children: [
                            const Icon(Icons.error),
                            const SizedBox(width: 5),
                            const Text("forgot_password").tr()
                          ],
                        )
                      ],
                    ),
                    const SizedBox(height: 20),
                    Wrap(
                      children: [
                        const Text("don't_have_an_account").tr(),
                        const SizedBox(width: 10),
                        const Text("sign_up").tr(),
                      ],
                    )
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
