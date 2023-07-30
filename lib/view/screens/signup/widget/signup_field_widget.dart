import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/app_manager/component/password_field.dart';
import 'package:flutter_boilerplate/app_manager/helper/navigation/navigation_helper.dart';
import 'package:flutter_boilerplate/app_manager/helper/show_toast.dart';
import 'package:flutter_boilerplate/app_manager/helper/validation_helper.dart';
import 'package:flutter_boilerplate/authentication/user_repository.dart';
import 'package:flutter_boilerplate/view/screens/dashboard/dashboard_screen.dart';
import 'package:flutter_boilerplate/view/screens/signin/signin_screen.dart';
import 'package:flutter_boilerplate/view_model/signup_view_model.dart';
import 'package:go_router/go_router.dart';

class SignUpFieldWidget extends StatefulWidget {
  final SignUpViewModel viewModel;
  final UserRepository userRepository;

  const SignUpFieldWidget(
      {super.key, required this.viewModel, required this.userRepository});

  @override
  State<SignUpFieldWidget> createState() => _SignUpFieldWidgetState();
}

class _SignUpFieldWidgetState extends State<SignUpFieldWidget> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Center(
      child: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 400),
          child: Form(
            child: Builder(builder: (ctx) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    key: const Key("sign_up"),
                    "sign_up",
                    style: theme.textTheme.headlineMedium,
                  ).tr(),
                  const SizedBox(height: 20),
                  TextFormField(
                    key: const Key("tf_first_name"),
                    controller: widget.viewModel.firstNameC,
                    decoration: const InputDecoration(hintText: "First Name"),
                    validator: ValidationHelper.nameValidation,
                    onFieldSubmitted: (val) {
                      onPressSignUp(ctx);
                    },
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                      controller: widget.viewModel.lastNameC,
                      key: const Key("tf_last_name"),
                      decoration: const InputDecoration(
                        hintText: "Last Name",
                      ),
                      validator: ValidationHelper.nameValidation,
                      onFieldSubmitted: (val) {
                        onPressSignUp(ctx);
                      }),
                  const SizedBox(height: 20),
                  TextFormField(
                      controller: widget.viewModel.emailC,
                      key: const Key("tf_email_address"),
                      decoration: const InputDecoration(
                        hintText: "Email",
                      ),
                      validator: ValidationHelper.emailValidation,
                      onFieldSubmitted: (val) {
                        onPressSignUp(ctx);
                      }),
                  const SizedBox(height: 20),
                  PasswordField(
                    key: const Key("tf_password"),
                    controller: widget.viewModel.passwordC,
                    hintText: "Enter Password",
                    validator: ValidationHelper.passwordValidation,
                    onFieldSubmitted: (val) {
                      onPressSignUp(ctx);
                    },
                  ),
                  const SizedBox(height: 20),
                  PasswordField(
                    key: const Key("tf_confirm_password"),
                    controller: widget.viewModel.confirmPasswordC,
                    hintText: "Confirm Password",
                    validator: ValidationHelper.passwordValidation,
                    onFieldSubmitted: (val) {
                      onPressSignUp(ctx);
                    },
                  ),
                  const SizedBox(height: 20),
                  TextButton(
                    onPressed: () {
                      onPressSignUp(ctx);
                    },
                    style: TextButton.styleFrom(
                      minimumSize: const Size.fromHeight(50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    child: const Text(key: Key("tb_sign_up"), "sign_up").tr(),
                  ),
                  const SizedBox(height: 20),
                  Wrap(
                    children: [
                      Text(
                              key: const Key("t_sign_up_description"),
                              "already_have_an_account",
                              style: theme.textTheme.bodyMedium)
                          .tr(),
                      const SizedBox(width: 10),
                      InkWell(
                        onTap: () => NavigationHelper.pushNamed(
                            context, SignInScreen.name),
                        child: Text(
                          key: const Key("t_sign_in"),
                          "sign_in",
                          style: theme.textTheme.bodyMedium,
                        ).tr(),
                      ),
                    ],
                  )
                ],
              );
            }),
          ),
        ),
      ),
    );
  }

  Future<void> onPressSignUp(BuildContext ctx) async {
    if (Form.of(ctx).validate()) {
      if (widget.viewModel.passwordC.text.trim() ==
          widget.viewModel.confirmPasswordC.text.trim()) {
        widget.viewModel.signUp(
            context:ctx,
            firstName: widget.viewModel.firstNameC.text.trim(),
            lastName: widget.viewModel.lastNameC.text.trim(),
            email: widget.viewModel.emailC.text.trim(),
            password: widget.viewModel.passwordC.text.trim());
      } else {
        showToast("Password & Confirm Password did not match");
      }
    } else {
      showToast("Fill Required Fields");
    }
  }
}
