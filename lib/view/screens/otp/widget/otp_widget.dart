import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/app_manager/helper/show_toast.dart';
import 'package:flutter_boilerplate/authentication/user_repository.dart';
import 'package:flutter_boilerplate/gen/assets.gen.dart';
import 'package:flutter_boilerplate/view_model/otp_view_model.dart';
import 'package:flutter_boilerplate/view_model/social_signin_view_model.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class OTPWidget extends StatefulWidget {
  final OTPViewModel viewModel;
  final SocialSignInViewModel googleSignInViewModel;
  final UserRepository userRepository;

  const OTPWidget(
      {super.key,
      required this.viewModel,
      required this.googleSignInViewModel,
      required this.userRepository});

  @override
  State<OTPWidget> createState() => _OTPWidgetState();
}

class _OTPWidgetState extends State<OTPWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Center(
      child: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 400),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Builder(builder: (ctx) {
              return Column(
                children: [
                  Container(
                    width: 200,
                    height: 200,
                    decoration: BoxDecoration(
                      color: theme.primaryColor.withOpacity(0.3),
                      shape: BoxShape.circle,
                    ),
                    child: Assets.png.icOtp2.image(),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  Text(
                          key: const Key("send_otp"),
                          'send_otp',
                          style: theme.textTheme.headlineSmall)
                      .tr(),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    key: const Key("add_your_phone_number"),
                    "add_your_phone_number",
                    style: theme.textTheme.bodyMedium,
                    textAlign: TextAlign.center,
                  ).tr(),
                  const SizedBox(
                    height: 28,
                  ),
                  Container(
                    padding: const EdgeInsets.all(28),
                    decoration: BoxDecoration(
                      border: Border.all(color: theme.primaryColor, width: 1),
                      color: theme.colorScheme.background,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Form(
                      child: Column(
                        children: [
                          IntlPhoneField(
                            decoration: InputDecoration(
                              errorStyle: const TextStyle(color: Colors.red),
                              labelText: 'mobile_number'.tr(),
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
                          const SizedBox(
                            height: 22,
                          ),
                          SizedBox(
                              width: double.infinity,
                              child: TextButton(
                                key: const Key("send"),
                                onPressed: () {
                                  if (widget.viewModel.isValidNumber) {
                                    widget.viewModel.setPhoneNumberValidated =
                                        true;
                                  } else {
                                    showToast("error_valid_mobile_number".tr());
                                  }
                                },
                                style: TextButton.styleFrom(
                                  minimumSize: const Size.fromHeight(50),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                ),
                                child: const Text("send").tr(),
                              ))
                        ],
                      ),
                    ),
                  ),
                ],
              );
            }),
          ),
        ),
      ),
    );
  }
}
