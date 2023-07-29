import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/app_manager/helper/navigation/navigation_helper.dart';
import 'package:flutter_boilerplate/app_manager/helper/validation_helper.dart';
import 'package:flutter_boilerplate/authentication/user_repository.dart';
import 'package:flutter_boilerplate/gen/assets.gen.dart';
import 'package:flutter_boilerplate/view_model/google_signin_view_model.dart';
import 'package:flutter_boilerplate/view_model/otp_view_model.dart';
import 'package:provider/provider.dart';

class OTPWidget extends StatefulWidget {
  final OTPViewModel viewModel;
  final GoogleSigninViewModel googleSignInViewModel;
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
                    child: Assets.png.otp2.image(),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  Text(
                      key:const Key("registration"),
                      'registration', style: theme.textTheme.headlineSmall)
                      .tr(),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    key:const Key("add_your_phone_number"),
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
                            key:const Key("phone"),
                            validator: (val) =>
                                ValidationHelper.mobileValidation(val),
                            controller: widget.viewModel.phoneC,
                            keyboardType: TextInputType.number,
                            style: theme.textTheme.bodyMedium,
                            decoration: InputDecoration(
                              hintText: "Phone",
                              prefix: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 5),
                                child: Text(
                                  '(+91)',
                                  style: theme.textTheme.bodyMedium,
                                ),
                              ),
                              suffixIcon: Icon(
                                Icons.check_circle,
                                color: theme.iconTheme.color,
                                size: 30,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 22,
                          ),
                          SizedBox(
                              width: double.infinity,
                              child: TextButton(
                                key:const Key("send"),
                                onPressed: () {
                                  widget.viewModel.setPhoneNumberEntered = true;
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
