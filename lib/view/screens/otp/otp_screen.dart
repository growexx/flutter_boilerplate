import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/app_manager/component/responsive/widget/responsive_helper.dart';
import 'package:flutter_boilerplate/authentication/user_repository.dart';
import 'package:flutter_boilerplate/view/screens/otp/widget/otp_verification_widget.dart';
import 'package:flutter_boilerplate/view/screens/otp/widget/otp_web_page_filler_widget.dart';
import 'package:flutter_boilerplate/view/screens/otp/widget/otp_widget.dart';
import 'package:flutter_boilerplate/view/screens/screens.dart';
import 'package:flutter_boilerplate/view_model/otp_view_model.dart';
import 'package:flutter_boilerplate/view_model/social_signin_view_model.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class OTPScreen extends StatefulWidget {
  static const String name = "otp";
  static const String path = "/$name";

  const OTPScreen({super.key});

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    final viewModel = Provider.of<OTPViewModel>(context, listen: false);
    final googleSignInViewModel =
        Provider.of<SocialSignInViewModel>(context, listen: false);
    final userRepository = Provider.of<UserRepository>(context, listen: false);

    Widget fillPhoneNumberWidget = OTPWidget(
      viewModel: viewModel,
      googleSignInViewModel: googleSignInViewModel,
      userRepository: userRepository,
    );

    Widget otpVerificationWidget = OTPVerificationWidget(
      viewModel: viewModel,
      googleSignInViewModel: googleSignInViewModel,
      userRepository: userRepository,
    );

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              context.goNamed(SignInScreen.name);
            },
            icon: const Icon(Icons.arrow_back_sharp)),
        title: Text("verify_pin",style: theme.textTheme.headlineSmall,).tr(),
        automaticallyImplyLeading: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: Consumer<OTPViewModel>(
              builder: (BuildContext context, value, Widget? child) {
                return ResponsiveHelperWidget(
                  mobile: value.isPhoneNumberEntered
                      ? otpVerificationWidget
                      : fillPhoneNumberWidget,
                  desktop: Row(
                    children: [
                      const Expanded(flex: 3, child: OTPWebPageFillerWidget()),
                      SizedBox(
                          width: 440,
                          child: value.isPhoneNumberEntered
                              ? otpVerificationWidget
                              : fillPhoneNumberWidget)
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
