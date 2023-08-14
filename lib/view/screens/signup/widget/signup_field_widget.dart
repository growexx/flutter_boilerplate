import 'dart:io';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/app_manager/component/password_field.dart';
import 'package:flutter_boilerplate/app_manager/helper/camera_and_images/custom_image_picker_widget.dart';
import 'package:flutter_boilerplate/app_manager/helper/navigation/navigation_helper.dart';
import 'package:flutter_boilerplate/app_manager/helper/show_toast.dart';
import 'package:flutter_boilerplate/app_manager/helper/validation_helper.dart';
import 'package:flutter_boilerplate/authentication/user_repository.dart';
import 'package:flutter_boilerplate/view/screens/components/text_field_spacer.dart';
import 'package:flutter_boilerplate/view/screens/signin/signin_screen.dart';
import 'package:flutter_boilerplate/view_model/signup_view_model.dart';
import 'package:provider/provider.dart';

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
    final SignUpViewModel viewModel =
        Provider.of<SignUpViewModel>(context, listen: false);
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
                      key: const Key("sign_up"),
                      "sign_up",
                      style: theme.textTheme.headlineMedium,
                    ).tr(),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Center(
                        child: GestureDetector(
                          key: const Key("pick_image_gesture_detector"),
                          behavior: HitTestBehavior.translucent,
                          onTap: () {
                            showCustomImagePicker(context,
                                onReceiveFilePath: (String? filePath) {
                              if (filePath != null) {
                                viewModel.selectedImagePath = filePath;
                              }
                            });
                          },
                          child: Center(
                            child: Container(
                                height: 130.0,
                                width: 130.0,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.grey.shade200,
                                ),
                                child: Center(
                                  child: Selector<SignUpViewModel, String?>(
                                      shouldRebuild: (prev, nex) => true,
                                      selector: (_, listener) =>
                                          listener.selectedImagePath,
                                      builder: (context, pickedImage, child) {
                                        return pickedImage == null
                                            ? Text(
                                                key: const Key(
                                                    "pick_image_text"),
                                                'pick_image',
                                                textAlign: TextAlign.center,
                                                style:
                                                    theme.textTheme.titleSmall,
                                              ).tr()
                                            : kIsWeb
                                                ? CircleAvatar(
                                                    key: const Key(
                                                        "circle_avatar_picked_image_web"),
                                                    backgroundImage:
                                                        NetworkImage(
                                                            pickedImage),
                                                    radius: 200.0,
                                                  )
                                                : CircleAvatar(
                                                    key: const Key(
                                                        "circle_avatar_picked_image"),
                                                    backgroundImage: FileImage(
                                                        File(pickedImage)),
                                                    radius: 200.0,
                                                  );
                                      }),
                                )),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      key: const Key("tf_first_name"),
                      controller: viewModel.firstNameC,
                      decoration:
                          InputDecoration(hintText: "enter_first_name".tr()),
                      validator: ValidationHelper.nameValidation,
                      onFieldSubmitted: (val) {
                        onPressSignUp(ctx);
                      },
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                        controller: viewModel.lastNameC,
                        key: const Key("tf_last_name"),
                        decoration: InputDecoration(
                          hintText: "enter_last_name".tr(),
                        ),
                        validator: ValidationHelper.nameValidation,
                        onFieldSubmitted: (val) {
                          onPressSignUp(ctx);
                        }),
                    const SizedBox(height: 20),
                    TextFormField(
                        controller: viewModel.emailC,
                        key: const Key("tf_email_address"),
                        decoration: InputDecoration(
                          hintText: "enter_email".tr(),
                        ),
                        validator: ValidationHelper.emailValidation,
                        onFieldSubmitted: (val) {
                          onPressSignUp(ctx);
                        }),
                    const SizedBox(height: 20),
                    TextFieldSpacer(
                      child: PasswordField(
                        key: const Key("tf_password"),
                        controller: viewModel.passwordC,
                        hintText: "enter_password".tr(),
                        onFieldSubmitted: (String? val) {
                          onPressSignUp(ctx);
                        },
                      ),
                    ),
                    PasswordField(
                      key: const Key("tf_confirm_password"),
                      controller: viewModel.confirmPasswordC,
                      hintText: "confirm_password".tr(),
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
      ),
    );
  }

  Future<void> onPressSignUp(BuildContext ctx) async {
    if (Form.of(ctx).validate()) {
      widget.viewModel.signUp(
          context: ctx,
          firstName: widget.viewModel.firstNameC.text.trim(),
          lastName: widget.viewModel.lastNameC.text.trim(),
          email: widget.viewModel.emailC.text.trim(),
          password: widget.viewModel.passwordC.text.trim());
    } else {
      showToast("fill_required_fields".tr());
    }
  }
}
