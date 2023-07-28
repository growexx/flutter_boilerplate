import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/app_manager/component/responsive/widget/responsive_helper.dart';
import 'package:flutter_boilerplate/app_manager/locale/widget/locale_selector_widget.dart';
import 'package:flutter_boilerplate/app_manager/theme/widget/theme_mode_selector.dart';
import 'package:flutter_boilerplate/authentication/user_repository.dart';
import 'package:flutter_boilerplate/view/screens/signup/widget/signup_field_widget.dart';
import 'package:flutter_boilerplate/view/screens/signup/widget/signup_web_page_filler_widget.dart';
import 'package:flutter_boilerplate/view_model/signup_view_model.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatefulWidget {
  static const String name = "signup";
  static const String path = "/$name";

  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<SignUpViewModel>(context, listen: false);
    final userRepository = Provider.of<UserRepository>(context, listen: false);

    Widget fieldPart = SignUpFieldWidget(
      viewModel: viewModel,
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
            child: ResponsiveHelperWidget(
              mobile: fieldPart,
              desktop: Row(
                children: [
                  const Expanded(child: SignUpWebPageFillerWidget()),
                  Expanded(child: fieldPart),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
