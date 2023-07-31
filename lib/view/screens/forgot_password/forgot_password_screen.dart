import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/app_manager/component/responsive/widget/responsive_helper.dart';
import 'package:flutter_boilerplate/authentication/user_repository.dart';
import 'package:flutter_boilerplate/view/screens/change_password/widget/change_password_web_page_filler_widget.dart';
import 'package:flutter_boilerplate/view/screens/forgot_password/widget/forgot_password_field_widget.dart';
import 'package:flutter_boilerplate/view_model/forgot_password_view_model.dart';
import 'package:provider/provider.dart';

class ForgotPasswordScreen extends StatefulWidget {
  static const String name = "forgot_password";
  static const String path = "/$name";

  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  @override
  Widget build(BuildContext context) {

    final viewModel = Provider.of<ForgotPasswordViewModel>(context,listen: false);
    final userRepository = Provider.of<UserRepository>(context,listen: false);

    Widget fieldPart = ForgotPasswordFieldWidget(
      viewModel: viewModel,
      userRepository: userRepository,
    );

    return Scaffold(
      body: ResponsiveHelperWidget(
        mobile: fieldPart,
        desktop: Row(
          children: [
            const Expanded(child: ChangePasswordWebPageFillerWidget()),
            SizedBox(width: 440,child: fieldPart),
          ],
        ),
      ),
    );
  }
}
