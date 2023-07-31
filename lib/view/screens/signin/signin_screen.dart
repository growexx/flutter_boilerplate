import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/app_manager/component/responsive/widget/responsive_helper.dart';
import 'package:flutter_boilerplate/app_manager/locale/widget/locale_selector_widget.dart';
import 'package:flutter_boilerplate/app_manager/theme/widget/theme_mode_selector.dart';
import 'package:flutter_boilerplate/authentication/user_repository.dart';
import 'package:flutter_boilerplate/view/screens/signin/widget/signin_field_widget.dart';
import 'package:flutter_boilerplate/view/screens/signin/widget/signin_web_page_filler_widget.dart';
import 'package:flutter_boilerplate/view_model/signin_view_model.dart';
import 'package:flutter_boilerplate/view_model/social_signin_view_model.dart';
import 'package:provider/provider.dart';

class SignInScreen extends StatefulWidget {

  static const String name = "signin";
  static const String path = "/$name";

  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<SignInViewModel>(context,listen: false);
    final googleSignInViewModel = Provider.of<SocialSignInViewModel>(context,listen: false);
    final userRepository = Provider.of<UserRepository>(context,listen: false);

    Widget controlBar = SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Wrap(
          alignment: WrapAlignment.spaceAround,
          children: [
            const ThemeModeSelector(),
            LocaleSelectorWidget(
              onLocaleChange: () {
                setState(() {

                });
              },
            )
          ],
        ),
      ),
    );

    Widget fieldPart = Column(
      children: [
        controlBar,
        Expanded(
          child: SignInFieldWidget(
            viewModel: viewModel,
            socialSignInViewModel: googleSignInViewModel,
            userRepository: userRepository,
          ),
        ),
      ],
    );

    return  Scaffold(
      body: ResponsiveHelperWidget(
        mobile: fieldPart,
        desktop: Row(
          children: [
            const Expanded(flex: 3,child: SignInWebPageFillerWidget()),
            SizedBox(
                width: 440,
                child: fieldPart),
          ],
        ),
      ),
    );
  }
}
