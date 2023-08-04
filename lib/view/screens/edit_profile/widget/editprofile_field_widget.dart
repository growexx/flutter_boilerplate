import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/app_manager/helper/show_toast.dart';
import 'package:flutter_boilerplate/app_manager/helper/validation_helper.dart';
import 'package:flutter_boilerplate/authentication/user_repository.dart';
import 'package:flutter_boilerplate/view_model/editprofile_view_model.dart';

class EditProfileFieldWidget extends StatefulWidget {
  final EditProfileViewModel viewModel;
  final UserRepository userRepository;

  const EditProfileFieldWidget(
      {super.key, required this.viewModel, required this.userRepository});

  @override
  State<EditProfileFieldWidget> createState() => _EditProfileFieldWidgetState();
}

class _EditProfileFieldWidgetState extends State<EditProfileFieldWidget> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Center(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 400),
            child: Form(
              child: Builder(builder: (ctx) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      key: const Key("editprofile"),
                      "editprofile",
                      style: theme.textTheme.headlineMedium,
                    ).tr(),
                    const SizedBox(height: 20),
                    TextFormField(
                      key: const Key("tf_first_name"),
                      controller: widget.viewModel.firstNameC,
                      decoration: InputDecoration(hintText: "enter_first_name".tr()),
                      validator: ValidationHelper.nameValidation,
                      onFieldSubmitted: (val) {
                        onPressEditProfile(ctx);
                      },
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                        controller: widget.viewModel.lastNameC,
                        key: const Key("tf_last_name"),
                        decoration: InputDecoration(
                          hintText: "enter_last_name".tr(),
                        ),
                        validator: ValidationHelper.nameValidation,
                        onFieldSubmitted: (val) {
                          onPressEditProfile(ctx);
                        }),
                    const SizedBox(height: 20),
                    TextFormField(
                        controller: widget.viewModel.emailC,
                        key: const Key("tf_email_address"),
                        decoration: InputDecoration(
                          hintText: "enter_email".tr(),
                        ),
                        validator: ValidationHelper.emailValidation,
                        onFieldSubmitted: (val) {
                          onPressEditProfile(ctx);
                        }),
                    const SizedBox(height: 20),
                    TextButton(
                      onPressed: () {
                        onPressEditProfile(ctx);
                      },
                      style: TextButton.styleFrom(
                        minimumSize: const Size.fromHeight(50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      child: const Text(key: Key("tb_editprofile"), "editprofile").tr(),
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

  Future<void> onPressEditProfile(BuildContext ctx) async {
    if (Form.of(ctx).validate()) {
        widget.viewModel.editProfile(
            context:ctx,
            firstName: widget.viewModel.firstNameC.text.trim(),
            lastName: widget.viewModel.lastNameC.text.trim(),
            email: widget.viewModel.emailC.text.trim());
    } else {
      showToast("Fill Required Fields");
    }
  }
}
