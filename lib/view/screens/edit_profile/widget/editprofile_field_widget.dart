import 'dart:io';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/app_manager/helper/show_toast.dart';
import 'package:flutter_boilerplate/app_manager/helper/validation_helper.dart';
import 'package:flutter_boilerplate/authentication/user_repository.dart';
import 'package:flutter_boilerplate/view_model/editprofile_view_model.dart';
import 'package:flutter_boilerplate/view/screens/signup/widget/select_image_options_widget.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

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
                    !kIsWeb?Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Center(
                        child: GestureDetector(
                          key: const Key("pick_image_gesture_detector"),
                          behavior: HitTestBehavior.translucent,
                          onTap: () {
                            if (kIsWeb) {
                              _pickImage(ImageSource.gallery);
                            } else {
                              _showSelectPhotoOptions(context);
                            }
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
                                  child: Selector<EditProfileViewModel, File?>(
                                      shouldRebuild: (prev, nex) => true,
                                      selector: (_, listener) =>
                                          listener.pickedImage,
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
                                            : CircleAvatar(
                                                key: const Key(
                                                    "circle_avatar_picked_image"),
                                                backgroundImage:
                                                    FileImage(pickedImage),
                                                radius: 200.0,
                                              );
                                      }),
                                )),
                          ),
                        ),
                      ),
                    ):const SizedBox(height: 0),
                    const SizedBox(
                      height: 20,
                    ),
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
    Future _pickImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;
      File? img = File(image.path);
      img = await _cropImage(imageFile: img);
      widget.viewModel.setPickedImage = img;
      // ignore: use_build_context_synchronously
      Navigator.of(context).pop();
    } on PlatformException catch (e) {
      if (kDebugMode) {
        print(e);
      }
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
              child: SelectImageOptionsScreen(
                onTap: _pickImage,
              ),
            );
          }),
    );
  }
}
