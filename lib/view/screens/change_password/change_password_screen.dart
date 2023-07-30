import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/app_manager/component/responsive/widget/responsive_helper.dart';
import 'package:flutter_boilerplate/app_manager/locale/widget/locale_selector_widget.dart';
import 'package:flutter_boilerplate/app_manager/theme/widget/theme_mode_selector.dart';
import 'package:flutter_boilerplate/authentication/user_repository.dart';
import 'package:flutter_boilerplate/view/screens/change_password/widget/change_password_field_widget.dart';
import 'package:flutter_boilerplate/view/screens/change_password/widget/change_password_web_page_filler_widget.dart';
import 'package:flutter_boilerplate/view_model/change_password_view_model.dart';
import 'package:provider/provider.dart';

class ChangePasswordScreen extends StatefulWidget {
  static const String name = "change_password";
  static const String path = "/$name";

  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  @override
  Widget build(BuildContext context) {
    final viewModel =
        Provider.of<ChangePasswordViewModel>(context, listen: false);
    final userRepository = Provider.of<UserRepository>(context, listen: false);

    Widget fieldPart = ChangePasswordFieldWidget(
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
                  const Expanded(
                      flex: 3, child: ChangePasswordWebPageFillerWidget()),
                  Expanded(flex: 1, child: fieldPart),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
