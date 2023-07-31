import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/app_manager/component/responsive/widget/responsive_helper.dart';
import 'package:flutter_boilerplate/authentication/user_repository.dart';
import 'package:flutter_boilerplate/view/screens/signup/widget/signup_field_widget.dart';
import 'package:flutter_boilerplate/view/widgets/welcome.dart';
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
      body: ResponsiveHelperWidget(
        mobile: fieldPart,
        desktop: Row(
          children: [
            const Expanded(child: WelcomeWidget()),
            SizedBox(width: 440,child: fieldPart),
          ],
        ),
      ),
    );
  }
}
