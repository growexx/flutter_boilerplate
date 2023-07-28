import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/app_manager/helper/navigation/navigation_helper.dart';
import 'package:flutter_boilerplate/app_manager/helper/validation_helper.dart';
import 'package:flutter_boilerplate/gen/assets.gen.dart';
import 'package:flutter_boilerplate/view/screens/dashboard_screen.dart';
import 'package:flutter_boilerplate/view/screens/forgot_password_screen.dart';
import 'package:flutter_boilerplate/view/screens/signup_screen.dart';
import 'package:flutter_boilerplate/viewmodel/login_view_model.dart';
import 'package:provider/provider.dart';

class LoginWidget extends StatefulWidget {
  const LoginWidget({super.key});

  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  var isChecked = false;
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    LoginViewModel loginViewModel =
        Provider.of<LoginViewModel>(context, listen: false);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          "sign_in",
          style: theme.textTheme.headlineMedium,
        ).tr(),
        const SizedBox(
          height: 10,
        ),
        Text("login_using_social_networks", style: theme.textTheme.bodyMedium)
            .tr(),
        const SizedBox(height: 20),
        Wrap(
          children: [
            Assets.png.facebook.image(width: 35, height: 35),
            const SizedBox(width: 20),
            Assets.png.instagram.image(width: 35, height: 35),
            const SizedBox(width: 20),
            Assets.png.google.image(width: 35, height: 35),
            const SizedBox(width: 20),
            Assets.png.twitter.image(width: 35, height: 35),
          ],
        ),
        const SizedBox(height: 20),
        Text("or_capital", style: theme.textTheme.bodyMedium).tr(),
        const SizedBox(height: 10),
        Form(
          key: formKey,
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10.0, horizontal: 30),
                child: TextFormField(
                    controller: loginViewModel.passwordC,
                    style: theme.textTheme.bodyMedium,
                    key: const Key("tff_email_address"),
                    decoration: const InputDecoration(
                      prefix: Padding(padding: EdgeInsets.only(left: 13)),
                      hintText: "Email",
                    ),
                    validator: (value) =>
                        ValidationHelper.emailValidation(value)),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10.0, horizontal: 30),
                child: TextFormField(
                    controller: loginViewModel.passwordC,
                    style: theme.textTheme.bodyMedium,
                    decoration: const InputDecoration(
                      prefix: Padding(padding: EdgeInsets.only(left: 13)),
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
                  SizedBox(
                    width: 30,
                    child: Checkbox(
                      fillColor: theme.checkboxTheme.fillColor,
                      value: isChecked,
                      onChanged: (bool? value) {
                        setState(() {
                          isChecked = value!;
                        });
                      },
                    ),
                  ),
                  Text(
                    "remember_me",
                    style: theme.textTheme.bodySmall,
                  ).tr()
                ],
              ),
              const SizedBox(width: 5),
              InkWell(
                  onTap: (){
                    NavigationHelper.pushNamed(context, ForgotPasswordScreen.name);
                  },
                  child: Text("forgot_password", style: theme.textTheme.bodySmall).tr())
            ],
          ),
        ),
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: TextButton(
            onPressed: () {
              if (formKey.currentState!.validate()) {
                NavigationHelper.pushNamed(context, DashboardScreen.name);
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
            Text("don't_have_an_account", style: theme.textTheme.bodyMedium)
                .tr(),
            const SizedBox(width: 10),
            InkWell(
                onTap: () =>
                    NavigationHelper.pushNamed(context, SignUpScreen.name),
                child: Text(
                  "sign_up",
                  style: theme.textTheme.bodyMedium,
                ).tr()),
          ],
        )
      ],
    );
  }
}
