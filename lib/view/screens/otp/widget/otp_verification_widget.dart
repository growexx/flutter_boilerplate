import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/authentication/user_repository.dart';
import 'package:flutter_boilerplate/gen/assets.gen.dart';
import 'package:flutter_boilerplate/view_model/otp_view_model.dart';
import 'package:flutter_boilerplate/view_model/social_signin_view_model.dart';
import 'package:pin_code_text_field/pin_code_text_field.dart';

class OTPVerificationWidget extends StatefulWidget {
  final OTPViewModel viewModel;
  final SocialSignInViewModel googleSignInViewModel;
  final UserRepository userRepository;

  const OTPVerificationWidget(
      {super.key,
      required this.viewModel,
      required this.googleSignInViewModel,
      required this.userRepository});

  @override
  State<OTPVerificationWidget> createState() => _OTPWidgetState();
}

class _OTPWidgetState extends State<OTPVerificationWidget> {

  TextEditingController controller = TextEditingController(text: "");
  String thisText = "";
  int pinLength = 4;
  bool hasError = false;
  late String errorMessage;

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
                  children: [
                    Container(
                      width: 200,
                      height: 200,
                      decoration: BoxDecoration(
                        color: theme.primaryColor.withOpacity(0.3),
                        shape: BoxShape.circle,
                      ),
                      child: Assets.png.icOtp3.image(),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    Text(
                      key: const Key("verification"),
                      'verification',
                      style: theme.textTheme.headlineMedium,
                    ).tr(),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      key: const Key("enter_otp"),
                      "enter_otp",
                      style: theme.textTheme.bodyMedium,
                      textAlign: TextAlign.center,
                    ).tr(),
                    const SizedBox(
                      height: 28,
                    ),
                    Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        children: [
                          Row(
                              key: const Key("otp_text_field_container"),
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                PinCodeTextField(
                                  autofocus: true,
                                  controller: controller,
                                  hideCharacter: false,
                                  highlight: true,
                                  highlightColor: Colors.blue,
                                  defaultBorderColor: Colors.black,
                                  hasTextBorderColor: Colors.green,
                                  highlightPinBoxColor: Colors.white,
                                  maxLength: pinLength,
                                  hasError: hasError,
                                  onTextChanged: (text) {
                                    setState(() {
                                      hasError = false;
                                    });
                                  },
                                  onDone: (text) {
                                    //print("DONE $text");
                                    //print("DONE CONTROLLER ${controller.text}");
                                  },
                                  pinBoxWidth: 50,
                                  pinBoxHeight: 64,
                                  hasUnderline: true,
                                  wrapAlignment: WrapAlignment.spaceAround,
                                  pinBoxDecoration:
                                  ProvidedPinBoxDecoration.defaultPinBoxDecoration,
                                  pinTextStyle: const TextStyle(fontSize: 22.0),
                                  pinTextAnimatedSwitcherTransition:
                                  ProvidedPinBoxTextAnimation.scalingTransition,
                                  pinTextAnimatedSwitcherDuration:
                                  const Duration(milliseconds: 300),
                                  highlightAnimationBeginColor: Colors.black,
                                  highlightAnimationEndColor: Colors.white12,
                                  keyboardType: TextInputType.number,
                                ),
                              ]),
                          const SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                            width: double.infinity,
                            child: TextButton(
                              key: const Key("verify"),
                              onPressed: () {
                                onPressVerify(context: ctx, otp: "1");
                              },
                              style: TextButton.styleFrom(
                                minimumSize: const Size.fromHeight(50),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5),
                                ),
                              ),
                              child: const Text("verify").tr(),
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 18,
                    ),
                    Text(
                      key: const Key("did_not_receive_code"),
                      "did_not_receive_code",
                      style: theme.textTheme.bodyMedium,
                      textAlign: TextAlign.center,
                    ).tr(),
                    const SizedBox(
                      height: 18,
                    ),
                    InkWell(
                      key: const Key("resend_new_code"),
                      onTap: () {
                        //work in progress
                        /*const snackBar = SnackBar(
                content: Text('Code sent again.'),
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);*/
                      },
                      child: Text(
                        "resend_new_code",
                        style: theme.textTheme.headlineSmall,
                        textAlign: TextAlign.center,
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

  Future<bool> onPressVerify(
      {required BuildContext context, required String otp}) async {
    widget.viewModel.otpVerification(context, otp);
    return true;
  }
}
