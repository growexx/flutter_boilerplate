import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/app_manager/helper/navigation/navigation_helper.dart';
import 'package:flutter_boilerplate/app_manager/helper/validation_helper.dart';
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
  var isChecked = false;
  final _formKey = GlobalKey<FormState>();

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
                    Text(
                      "sign_in",
                      style: theme.textTheme.headlineMedium,
                    ).tr(),
                    const SizedBox(
                      height: 10,
                    ),
                    Text("login_using_social_networks",
                            style: theme.textTheme.bodyMedium)
                        .tr(),
                    const SizedBox(height: 20),
                    Wrap(
                      children: [
                        Image.asset('assets/png/ic_facebook.png',
                            height: 35, width: 35),
                        const SizedBox(width: 20),
                        Image.asset('assets/png/ic_google.png',
                            height: 35, width: 35),
                        const SizedBox(width: 20),
                        Image.asset('assets/png/ic_instagram.png',
                            height: 35, width: 35),
                        const SizedBox(width: 20),
                        Image.asset('assets/png/ic_twitter.png',
                            height: 35, width: 35)
                      ],
                    ),
                    const SizedBox(height: 20),
                    Text("or_capital", style: theme.textTheme.bodyMedium).tr(),
                    const SizedBox(height: 10),
                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 30),
                            child: TextFormField(
                                key: const Key("tff_email_address"),
                                decoration: const InputDecoration(
                                  prefix: Padding(
                                      padding: EdgeInsets.only(left: 13)),
                                  hintText: "Email",
                                ),
                                validator: (value) =>
                                    ValidationHelper.emailValidation(value)),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 30),
                            child: TextFormField(
                                decoration: const InputDecoration(
                                  prefix: Padding(
                                      padding: EdgeInsets.only(left: 13)),
                                  hintText: "Password",
                                ),
                                validator: (value) =>
                                    ValidationHelper.passwordValidation(value),
                                key: const Key("tff_password"),
                                obscureText: true),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Wrap(
                            crossAxisAlignment: WrapCrossAlignment.center,
                            children: [
                              Checkbox(
                                checkColor: Colors.white,
                                value: isChecked,
                                onChanged: (bool? value) {
                                  setState(() {
                                    isChecked = value!;
                                  });
                                },
                              ),
                              Text(
                                "remember_me",
                                style: theme.textTheme.bodySmall,
                              ).tr()
                            ],
                          ),
                          const SizedBox(width: 5),
                          Text("forgot_password",
                                  style: theme.textTheme.bodySmall)
                              .tr()
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: TextButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            NavigationHelper.pushNamed(
                                context, DashboardScreen.name);
                          }
                        },
                        style: TextButton.styleFrom(
                          minimumSize: const Size.fromHeight(50),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        child: const Text("sign_in").tr(),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Wrap(
                      children: [
                        Text("don't_have_an_account",
                                style: theme.textTheme.bodyMedium)
                            .tr(),
                        const SizedBox(width: 10),
                        Text("sign_up", style: theme.textTheme.bodyMedium).tr(),
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
