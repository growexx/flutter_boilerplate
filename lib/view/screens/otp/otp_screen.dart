import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/app_manager/component/responsive/widget/responsive_helper.dart';
import 'package:flutter_boilerplate/app_manager/locale/widget/locale_selector_widget.dart';
import 'package:flutter_boilerplate/app_manager/theme/widget/theme_mode_selector.dart';
import 'package:flutter_boilerplate/authentication/user_repository.dart';
import 'package:flutter_boilerplate/view/screens/otp/widget/otp_verification_widget.dart';
import 'package:flutter_boilerplate/view/screens/otp/widget/otp_web_page_filler_widget.dart';
import 'package:flutter_boilerplate/view/screens/otp/widget/otp_widget.dart';
import 'package:flutter_boilerplate/view_model/google_signin_view_model.dart';
import 'package:flutter_boilerplate/view_model/otp_view_model.dart';
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
    final viewModel = Provider.of<OTPViewModel>(context, listen: false);
    final googleSignInViewModel =
        Provider.of<GoogleSigninViewModel>(context, listen: false);
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
      body: Column(
        children: [
          SizedBox(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Wrap(
                alignment: WrapAlignment.spaceAround,
                children: [
                  const ThemeModeSelector(),
                  LocaleSelectorWidget(
                    onLocaleChange: () {
                      setState(() {});
                    },
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Consumer(
              builder: (BuildContext context, value, Widget? child) {
                return ResponsiveHelperWidget(
                  mobile: viewModel.isPhoneNumberEntered
                      ? fillPhoneNumberWidget
                      : otpVerificationWidget,
                  desktop: Row(
                    children: [
                      const Expanded(child: OTPWebPageFillerWidget()),
                      Expanded(child: fillPhoneNumberWidget),
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
