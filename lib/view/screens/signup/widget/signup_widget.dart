import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/app_manager/helper/navigation/navigation_helper.dart';
import 'package:flutter_boilerplate/app_manager/helper/validation_helper.dart';
import 'package:flutter_boilerplate/view/screens/signin/signin_screen.dart';
import 'package:flutter_boilerplate/view_model/signup_view_model.dart';
import 'package:provider/provider.dart';

class SignUpWidget extends StatefulWidget {
  const SignUpWidget({super.key});

  @override
  State<SignUpWidget> createState() => _SignUpWidgetState();
}

class _SignUpWidgetState extends State<SignUpWidget> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    SignUpViewModel signupViewModel =
        Provider.of<SignUpViewModel>(context, listen: false);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          "sign_up",
          style: theme.textTheme.headlineMedium,
        ).tr(),
        const SizedBox(height: 20),
        Form(
          key: formKey,
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10.0, horizontal: 30),
                child: TextFormField(
                    controller: signupViewModel.firstNameC,
                    key: const Key("tff_first_name"),
                    decoration: const InputDecoration(
                      prefix: Padding(padding: EdgeInsets.only(left: 13)),
                      hintText: "First Name",
                    ),
                    validator: (value) =>
                        ValidationHelper.nameValidation(value)),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10.0, horizontal: 30),
                child: TextFormField(
                    controller: signupViewModel.lastNameC,
                    key: const Key("tff_last_name"),
                    decoration: const InputDecoration(
                      prefix: Padding(padding: EdgeInsets.only(left: 13)),
                      hintText: "Last Name",
                    ),
                    validator: (value) =>
                        ValidationHelper.nameValidation(value)),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10.0, horizontal: 30),
                child: TextFormField(
                    controller: signupViewModel.emailC,
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
                    controller: signupViewModel.passwordC,
                    decoration: const InputDecoration(
                      prefix: Padding(padding: EdgeInsets.only(left: 13)),
                      hintText: "Password",
                    ),
                    validator: (value) =>
                        ValidationHelper.passwordValidation(value),
                    key: const Key("tff_password"),
                    obscureText: true),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10.0, horizontal: 30),
                child: TextFormField(
                    controller: signupViewModel.confirmPasswordC,
                    decoration: const InputDecoration(
                      prefix: Padding(padding: EdgeInsets.only(left: 13)),
                      hintText: "Confirm Password",
                    ),
                    validator: (value) =>
                        ValidationHelper.passwordValidation(value),
                    key: const Key("tff_cnf_password"),
                    obscureText: true),
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: TextButton(
            onPressed: () {
              if (formKey.currentState!.validate()) {
                NavigationHelper.pushNamed(context, SignInScreen.name);
              }
            },
            style: TextButton.styleFrom(
              minimumSize: const Size.fromHeight(50),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
            ),
            child: const Text("sign_up").tr(),
          ),
        ),
        const SizedBox(height: 20),
        Wrap(
          children: [
            Text("already_have_an_account", style: theme.textTheme.bodyMedium)
                .tr(),
            const SizedBox(width: 10),
            InkWell(
              onTap: () =>
                  NavigationHelper.pushNamed(context, SignInScreen.name),
              child: Text(
                "sign_in",
                style: theme.textTheme.bodyMedium,
              ).tr(),
            ),
          ],
        )
      ],
    );
  }
}
