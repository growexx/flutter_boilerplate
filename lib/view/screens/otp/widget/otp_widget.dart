import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/app_manager/helper/validation_helper.dart';
import 'package:flutter_boilerplate/authentication/user_repository.dart';
import 'package:flutter_boilerplate/gen/assets.gen.dart';
import 'package:flutter_boilerplate/view_model/otp_view_model.dart';
import 'package:flutter_boilerplate/view_model/social_signin_view_model.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class OTPWidget extends StatefulWidget {
  final OTPViewModel viewModel;
  final SocialSignInViewModel googleSignInViewModel;
  final UserRepository userRepository;

  const OTPWidget({super.key,
    required this.viewModel,
    required this.googleSignInViewModel,
    required this.userRepository});

  @override
  State<OTPWidget> createState() => _OTPWidgetState();
}

class _OTPWidgetState extends State<OTPWidget> {
  late PhoneNumber number;

  @override
  void initState() {
    super.initState();
    //number = getInitialNumber() as PhoneNumber;
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
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Form(
                      child: Column(
                        children: [
                          TextFormField(
                            maxLines: 1,
                            maxLength: 10,
                            key:const Key("phone"),
                            controller: widget.viewModel.phoneC,
                            decoration:
                            InputDecoration(hintText: "mobile_number".tr()),
                            validator: ValidationHelper.emailValidation,
                            onFieldSubmitted: (val) {
                            },
                          ),
                         /* InternationalPhoneNumberInput(
                            key: const Key("phone"),
                            validator: (val) =>
                                ValidationHelper.mobileValidation(val),
                            onInputChanged: (PhoneNumber number) {
                              //track number
                            },
                            onInputValidated: (bool value) {
                              //validate value
                            },
                            selectorConfig: const SelectorConfig(
                              selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
                            ),
                            inputDecoration: InputDecoration(
                              hintText: "mobile_number".tr(),
                            ),
                            ignoreBlank: false,
                            autoValidateMode: AutovalidateMode.disabled,
                            selectorTextStyle: const TextStyle(
                                color: Colors.black),
                            textFieldController: widget.viewModel.phoneC,
                            formatInput: true,
                            keyboardType: const TextInputType.numberWithOptions(
                                signed: true, decimal: true),
                            inputBorder: const OutlineInputBorder(),
                            onSaved: (PhoneNumber number) {
                              //print('On Saved: $number');
                            },
                          ),*/
                          const SizedBox(
                            height: 22,
                          ),
                          SizedBox(
                              width: 100,
                              child: TextButton(
                                key: const Key("send"),
                                onPressed: () {
                                  widget.viewModel.setPhoneNumberValidated =
                                  true;
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

  Future<PhoneNumber> getInitialNumber() async {
    var phoneNumber = "+234 500 500 5005";
    await PhoneNumber.getRegionInfoFromPhoneNumber(phoneNumber).then((value){
        number = value;
    });
    return number;
  }
}
