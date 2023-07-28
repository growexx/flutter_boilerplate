import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/app_manager/helper/navigation/navigation_helper.dart';
import 'package:flutter_boilerplate/app_manager/helper/show_toast.dart';
import 'package:flutter_boilerplate/app_manager/helper/validation_helper.dart';
import 'package:flutter_boilerplate/gen/assets.gen.dart';
import 'package:flutter_boilerplate/view/screens/dashboard_screen.dart';
import 'package:flutter_boilerplate/view/screens/login_screen.dart';
import 'package:flutter_boilerplate/view/screens/signup_screen.dart';
import 'package:flutter_boilerplate/viewmodel/change_password_view_model.dart';
import 'package:flutter_boilerplate/viewmodel/forgot_password_view_model.dart';
import 'package:flutter_boilerplate/viewmodel/login_view_model.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class ForgotPasswordWidget extends StatefulWidget {
  const ForgotPasswordWidget({super.key});

  @override
  State<ForgotPasswordWidget> createState() => _ForgotPasswordWidgetState();
}

class _ForgotPasswordWidgetState extends State<ForgotPasswordWidget> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    ForgotPasswordViewModel forgotPasswordViewModel =
        Provider.of<ForgotPasswordViewModel>(context, listen: false);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        Text(
          "forgot_password",
          style: theme.textTheme.headlineMedium,
        ).tr(),
        const SizedBox(height: 20),
        Text(
          "forgot_password_description",
          style: theme.textTheme.headlineSmall,
        ).tr(),
        Form(
          key: formKey,
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10.0, horizontal: 30),
                child: TextFormField(
                    obscureText: true,
                    controller: forgotPasswordViewModel.emailAddressC,
                    style: theme.textTheme.bodyMedium,
                    key: const Key("tff_email_address"),
                    decoration: const InputDecoration(
                      prefix: Padding(padding: EdgeInsets.only(left: 13)),
                      hintText: "Enter email address",
                    ),
                    validator: (value) =>
                        ValidationHelper.emailValidation(value)),
              )
            ],
          ),
        ),
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: TextButton(
            onPressed: () {
              if (formKey.currentState!.validate()) {
                //here we can add api call code for change password
                NavigationHelper.pushNamed(context, LoginScreen.name);
              }
            },
            style: TextButton.styleFrom(
              minimumSize: const Size.fromHeight(50),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
            ),
            child: const Text("request_reset_link").tr(),
          ),
        ),
        const SizedBox(height: 20),
        InkWell(
          onTap: () {
            NavigationHelper.pushNamed(context, LoginScreen.name);
          },
          child: Text(
            "back_to_login",
            style: theme.textTheme.headlineSmall,
          ).tr(),
        ),
      ],
    );
  }
}
