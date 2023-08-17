import 'dart:io';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/app_manager/helper/show_toast.dart';
import 'package:flutter_boilerplate/app_manager/helper/validation_helper.dart';
import 'package:flutter_boilerplate/authentication/user_repository.dart';
import 'package:flutter_boilerplate/view_model/editprofile_view_model.dart';
import 'package:flutter/foundation.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:provider/provider.dart';

import '../../../../app_manager/helper/camera_and_images/custom_image_picker_widget.dart';

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
    final EditProfileViewModel viewModel =
        Provider.of<EditProfileViewModel>(context, listen: false);
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
                                  child: Selector<EditProfileViewModel,
                                          String?>(
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
                    const SizedBox(height: 20),
                    TextFormField(
                      key: const Key("tf_first_name"),
                      controller: widget.viewModel.firstNameC,
                      decoration:
                          InputDecoration(hintText: "enter_first_name".tr()),
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
                    /*TextFormField(
                      keyboardType: TextInputType.number,
                      key: const Key("tf_mobile_number"),
                      controller: widget.viewModel.phoneC,
                      decoration:
                          InputDecoration(hintText: 'mobile_number'.tr()),
                      onFieldSubmitted: (val) {
                        //
                      },
                    ),*/
                    IntlPhoneField(
                      key: const Key("tf_mobile_number"),
                      decoration: InputDecoration(
                        errorStyle: const TextStyle(color: Colors.red),
                        hintText: 'mobile_number'.tr(),
                        hintStyle:  TextStyle(color: Colors.grey.withOpacity(0.7)),
                        floatingLabelStyle:
                        TextStyle(color: theme.primaryColor),
                        border: const OutlineInputBorder(
                          borderSide: BorderSide(),
                        ),
                      ),
                      initialCountryCode: 'IN',
                      onChanged: (phone) {
                        if (phone.isValidNumber()) {
                          widget.viewModel.setIsValidNumber = true;
                        } else {
                          widget.viewModel.setIsValidNumber = false;
                        }
                      },
                    ),
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
                      child:
                          const Text(key: Key("tb_editprofile"), "editprofile")
                              .tr(),
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
          context: ctx,
          firstName: widget.viewModel.firstNameC.text.trim(),
          lastName: widget.viewModel.lastNameC.text.trim(),
          email: widget.viewModel.emailC.text.trim(),
          phone: widget.viewModel.phoneC.text.trim());
    } else {
      showToast("Fill Required Fields");
    }
  }
}
