import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/app_manager/component/password_field.dart';
import 'package:flutter_boilerplate/app_manager/helper/show_toast.dart';
import 'package:flutter_boilerplate/app_manager/helper/validation_helper.dart';
import 'package:flutter_boilerplate/authentication/user_repository.dart';
import 'package:flutter_boilerplate/view_model/change_password_view_model.dart';

class ChangePasswordFieldWidget extends StatefulWidget {
  final ChangePasswordViewModel viewModel;
  final UserRepository userRepository;

  const ChangePasswordFieldWidget(
      {super.key, required this.viewModel, required this.userRepository});

  @override
  State<ChangePasswordFieldWidget> createState() =>
      _ChangePasswordFieldWidgetState();
}

class _ChangePasswordFieldWidgetState extends State<ChangePasswordFieldWidget> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Center(
      child: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 400),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Form(
              child: Builder(builder: (ctx) {
                return Column(
                  children: [
                    Text(
                      key: const Key("title_change_password"),
                      "change_password",
                      style: theme.textTheme.headlineMedium,
                    ).tr(),
                    const SizedBox(key: Key("size_one"), height: 20),
                    PasswordField(
                      key: const Key("tf_old_password"),
                      controller: widget.viewModel.oldPasswordC,
                      hintText: "old_password".tr(),
                      validator: ValidationHelper.passwordValidation,
                      onFieldSubmitted: (val) {
                        onPressChangePassword(ctx);
                      },
                    ),
                    const SizedBox(key: Key("size_two"), height: 20),
                    PasswordField(
                      key: const Key("tf_new_password"),
                      controller: widget.viewModel.newPasswordC,
                      hintText: "new_password".tr(),
                      validator: ValidationHelper.passwordValidation,
                      onFieldSubmitted: (val) {
                        onPressChangePassword(ctx);
                      },
                    ),
                    const SizedBox(key: Key("size_three"), height: 20),
                    PasswordField(
                      key: const Key("tf_confirm_new_password"),
                      controller: widget.viewModel.confirmNewPasswordC,
                      hintText: "confirm_new_password".tr(),
                      validator: ValidationHelper.passwordValidation,
                      onFieldSubmitted: (val) {
                        onPressChangePassword(ctx);
                      },
                    ),
                    const SizedBox(key: Key("size_four"), height: 20),
                    TextButton(
                      key: const Key("tb_change_password"),
                      onPressed: () {
                        onPressChangePassword(ctx);
                      },
                      style: TextButton.styleFrom(
                        minimumSize: const Size.fromHeight(50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      child: const Text("change_password").tr(),
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

  Future<void> onPressChangePassword(BuildContext ctx) async {
    if (Form.of(ctx).validate()) {
      if (widget.viewModel.oldPasswordC.text.trim() ==
          widget.viewModel.newPasswordC.text.trim()) {
        showToast("change_new_old_password".tr());
        return;
      }
      if (widget.viewModel.newPasswordC.text.trim() !=
          widget.viewModel.confirmNewPasswordC.text.trim()) {
        showToast("change_new_confirm_password".tr());
        return;
      }
      widget.viewModel.changePassword(
          context: ctx,
          oldPassword: widget.viewModel.oldPasswordC.text.trim(),
          newPassword: widget.viewModel.newPasswordC.text.trim());
    } else {
      showToast("validation".tr(gender: "fill_required_fields".tr()));
    }
  }
}
