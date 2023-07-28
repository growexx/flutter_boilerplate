import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/app_manager/helper/navigation/navigation_helper.dart';
import 'package:flutter_boilerplate/app_manager/helper/show_toast.dart';
import 'package:flutter_boilerplate/app_manager/helper/validation_helper.dart';
import 'package:flutter_boilerplate/authentication/user_repository.dart';
import 'package:flutter_boilerplate/view/screens/signin/signin_screen.dart';
import 'package:flutter_boilerplate/view_model/forgot_password_view_model.dart';

class ForgotPasswordFieldWidget extends StatefulWidget {
  final ForgotPasswordViewModel viewModel;
  final UserRepository userRepository;

  const ForgotPasswordFieldWidget(
      {super.key, required this.viewModel, required this.userRepository});

  @override
  State<ForgotPasswordFieldWidget> createState() =>
      _ForgotPasswordFieldWidgetState();
}

class _ForgotPasswordFieldWidgetState extends State<ForgotPasswordFieldWidget> {
  final formKey = GlobalKey<FormState>();

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
                      "forgot_password",
                      style: theme.textTheme.headlineMedium,
                    ).tr(),
                    const SizedBox(height: 20),
                    Text(
                      "forgot_password_description",
                      style: theme.textTheme.bodyMedium,
                    ).tr(),
                    const SizedBox(height: 20),
                    TextFormField(
                      controller: widget.viewModel.emailAddressC,
                      decoration:
                          const InputDecoration(hintText: "Enter Email"),
                      validator: ValidationHelper.emailValidation,
                      onFieldSubmitted: (val) {
                        onPressReset(ctx);
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextButton(
                      onPressed: () {
                        onPressReset(ctx);
                      },
                      style: TextButton.styleFrom(
                        minimumSize: const Size.fromHeight(50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      child: const Text("request_reset_link").tr(),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    InkWell(
                      onTap: () {
                        NavigationHelper.pushNamed(context, SignInScreen.name);
                      },
                      child: Text(
                        "back_to_login",
                        style: theme.textTheme.bodySmall,
                      ).tr(),
                    ),
                  ],
                );
              }),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> onPressReset(BuildContext ctx) async {
    if (Form.of(ctx).validate()) {
      widget.viewModel
          .forgotPassword(email: widget.viewModel.emailAddressC.text);
    } else {
      showToast("Fill Required Fields");
    }
  }
}
