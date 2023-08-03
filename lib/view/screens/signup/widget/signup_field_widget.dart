import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_boilerplate/app_manager/component/password_field.dart';
import 'package:flutter_boilerplate/app_manager/helper/navigation/navigation_helper.dart';
import 'package:flutter_boilerplate/app_manager/helper/show_toast.dart';
import 'package:flutter_boilerplate/app_manager/helper/validation_helper.dart';
import 'package:flutter_boilerplate/authentication/user_repository.dart';
import 'package:flutter_boilerplate/view/screens/signin/signin_screen.dart';
import 'package:flutter_boilerplate/view_model/signup_view_model.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

import 'select_photo_options_screen.dart';

class SignUpFieldWidget extends StatefulWidget {
  final SignUpViewModel viewModel;
  final UserRepository userRepository;

  const SignUpFieldWidget(
      {super.key, required this.viewModel, required this.userRepository});

  @override
  State<SignUpFieldWidget> createState() => _SignUpFieldWidgetState();
}

class _SignUpFieldWidgetState extends State<SignUpFieldWidget> {
  File? _image;
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
                      key: const Key("sign_up"),
                      "sign_up",
                      style: theme.textTheme.headlineMedium,
                    ).tr(),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Center(
                        child: GestureDetector(
                          behavior: HitTestBehavior.translucent,
                          onTap: () {
                            _showSelectPhotoOptions(context);
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
                                  child: _image == null
                                      ? const Text(
                                    'No image selected',
                                    style: TextStyle(fontSize: 20),
                                  )
                                      : CircleAvatar(
                                    backgroundImage: FileImage(_image!),
                                    radius: 200.0,
                                  ),
                                )),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20,),
                    TextFormField(
                      key: const Key("tf_first_name"),
                      controller: widget.viewModel.firstNameC,
                      decoration: InputDecoration(hintText: "enter_first_name".tr()),
                      validator: ValidationHelper.nameValidation,
                      onFieldSubmitted: (val) {
                        onPressSignUp(ctx);
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
                          onPressSignUp(ctx);
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
                          onPressSignUp(ctx);
                        }),
                    const SizedBox(height: 20),
                    PasswordField(
                      key: const Key("tf_password"),
                      controller: widget.viewModel.passwordC,
                      hintText: "enter_password".tr(),
                      validator: ValidationHelper.passwordValidation,
                      onFieldSubmitted: (val) {
                        onPressSignUp(ctx);
                      },
                    ),
                    const SizedBox(height: 20),
                    PasswordField(
                      key: const Key("tf_confirm_password"),
                      controller: widget.viewModel.confirmPasswordC,
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

  Future _pickImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;
      File? img = File(image.path);
      img = await _cropImage(imageFile: img);
      setState(() {
        _image = img;
        Navigator.of(context).pop();
      });
    } on PlatformException catch (e) {
      Navigator.of(context).pop();
    }
  }

  Future<File?> _cropImage({required File imageFile}) async {
    CroppedFile? croppedImage =
    await ImageCropper().cropImage(sourcePath: imageFile.path);
    if (croppedImage == null) return null;
    return File(croppedImage.path);
  }

  void _showSelectPhotoOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(25.0),
        ),
      ),
      builder: (context) => DraggableScrollableSheet(
          initialChildSize: 0.28,
          maxChildSize: 0.4,
          minChildSize: 0.28,
          expand: false,
          builder: (context, scrollController) {
            return SingleChildScrollView(
              controller: scrollController,
              child: SelectPhotoOptionsScreen(
                onTap: _pickImage,
              ),
            );
          }),
    );
  }
}
