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
import 'package:flutter_boilerplate/viewmodel/login_view_model.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class ChangePasswordWidget extends StatefulWidget {
  const ChangePasswordWidget({super.key});

  @override
  State<ChangePasswordWidget> createState() => _ChangePasswordWidgetState();
}

class _ChangePasswordWidgetState extends State<ChangePasswordWidget> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    ChangePasswordViewModel changePasswordViewModel =
        Provider.of<ChangePasswordViewModel>(context, listen: false);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          "change_password",
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
                    obscureText: true,
                    controller: changePasswordViewModel.oldPasswordC,
                    style: theme.textTheme.bodyMedium,
                    key: const Key("tff_old_password"),
                    decoration: const InputDecoration(
                      prefix: Padding(padding: EdgeInsets.only(left: 13)),
                      hintText: "Old Password",
                    ),
                    validator: (value) =>
                        ValidationHelper.passwordValidation(value)),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10.0, horizontal: 30),
                child: TextFormField(
                    obscureText: true,
                    controller: changePasswordViewModel.newPasswordC,
                    style: theme.textTheme.bodyMedium,
                    key: const Key("tff_new_password"),
                    decoration: const InputDecoration(
                      prefix: Padding(padding: EdgeInsets.only(left: 13)),
                      hintText: "New Password",
                    ),
                    validator: (value) =>
                        ValidationHelper.passwordValidation(value)),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10.0, horizontal: 30),
                child: TextFormField(
                    obscureText: true,
                    controller: changePasswordViewModel.confirmNewPasswordC,
                    style: theme.textTheme.bodyMedium,
                    key: const Key("tff_confirm_new_password"),
                    decoration: const InputDecoration(
                      prefix: Padding(padding: EdgeInsets.only(left: 13)),
                      hintText: "Confirm New Password",
                    ),
                    validator: (value) =>
                        ValidationHelper.passwordValidation(value)),
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
                if (changePasswordViewModel.newPasswordC.text.trim() ==
                    changePasswordViewModel.confirmNewPasswordC.text.trim()) {
                  showToast("Password and Confirm Password didn't match");
                } else {
                  //here we can add api call code for change password
                  NavigationHelper.pushNamed(context,LoginScreen.name);
                }
              }
            },
            style: TextButton.styleFrom(
              minimumSize: const Size.fromHeight(50),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
            ),
            child: const Text("change_password").tr(),
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
