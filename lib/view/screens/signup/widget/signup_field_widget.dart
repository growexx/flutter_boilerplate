import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/app_manager/component/password_field.dart';
import 'package:flutter_boilerplate/app_manager/helper/navigation/navigation_helper.dart';
import 'package:flutter_boilerplate/app_manager/helper/show_toast.dart';
import 'package:flutter_boilerplate/app_manager/helper/validation_helper.dart';
import 'package:flutter_boilerplate/authentication/user_repository.dart';
import 'package:flutter_boilerplate/view/screens/signin/signin_screen.dart';
import 'package:flutter_boilerplate/view_model/signup_view_model.dart';

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
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              child: Builder(builder: (ctx) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "sign_up",
                      style: theme.textTheme.headlineMedium,
                    ).tr(),
                    const SizedBox(height: 20),
                    Form(
                      child: Column(
                        children: [
                          TextFormField(
                              controller: widget.viewModel.firstNameC,
                              key: const Key("tff_first_name"),
                              decoration: const InputDecoration(
                                prefix:
                                    Padding(padding: EdgeInsets.only(left: 13)),
                                hintText: "First Name",
                              ),
                              validator: (value) =>
                                  ValidationHelper.nameValidation(value)),
                          const SizedBox(height: 20),
                          TextFormField(
                              controller: widget.viewModel.lastNameC,
                              key: const Key("tff_last_name"),
                              decoration: const InputDecoration(
                                prefix:
                                    Padding(padding: EdgeInsets.only(left: 13)),
                                hintText: "Last Name",
                              ),
                              validator: (value) =>
                                  ValidationHelper.nameValidation(value)),
                          const SizedBox(height: 20),
                          TextFormField(
                              controller: widget.viewModel.emailC,
                              key: const Key("tff_email_address"),
                              decoration: const InputDecoration(
                                prefix:
                                    Padding(padding: EdgeInsets.only(left: 13)),
                                hintText: "Email",
                              ),
                              validator: (value) =>
                                  ValidationHelper.emailValidation(value)),
                          const SizedBox(height: 20),
                          PasswordField(
                            key: const Key("tff_password"),
                            controller: widget.viewModel.passwordC,
                            hintText: "Enter Password",
                            validator: ValidationHelper.passwordValidation,
                            onFieldSubmitted: (val) {
                              onPressSignUp(ctx);
                            },
                          ),
                          const SizedBox(height: 20),
                          PasswordField(
                            key: const Key("tff_cnf_password"),
                            controller: widget.viewModel.passwordC,
                            hintText: "Confirm Password",
                            validator: ValidationHelper.passwordValidation,
                            onFieldSubmitted: (val) {
                              onPressSignUp(ctx);
                            },
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: TextButton(
                        onPressed: () {
                          onPressSignUp(ctx);
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
                        Text("already_have_an_account",
                                style: theme.textTheme.bodyMedium)
                            .tr(),
                        const SizedBox(width: 10),
                        InkWell(
                          onTap: () => NavigationHelper.pushNamed(
                              context, SignInScreen.name),
                          child: Text(
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
      ),
    );
  }

  Future<void> onPressSignUp(BuildContext ctx) async {
    if (Form.of(ctx).validate()) {
      widget.viewModel.signUp(
          firstName: widget.viewModel.firstNameC.text.trim(),
          lastName: widget.viewModel.lastNameC.text.trim(),
          email: widget.viewModel.emailC.text.trim(),
          password: widget.viewModel.passwordC.text.trim());
    } else {
      showToast("Fill Required Fields");
    }
  }
}
