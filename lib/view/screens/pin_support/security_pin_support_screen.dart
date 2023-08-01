import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/app_manager/component/responsive/widget/responsive_helper.dart';
import 'package:flutter_boilerplate/app_manager/locale/widget/locale_selector_widget.dart';
import 'package:flutter_boilerplate/app_manager/theme/widget/theme_mode_selector.dart';
import 'package:flutter_boilerplate/authentication/user_repository.dart';
import 'package:flutter_boilerplate/view/screens/pin_support/widget/security_pin_web_page_filler_widget.dart';
import 'package:flutter_boilerplate/view/screens/pin_support/widget/set_pin_field_widget.dart';
import 'package:flutter_boilerplate/view/screens/pin_support/widget/verify_pin_field_widget.dart';
import 'package:flutter_boilerplate/view_model/security_pin_view_model.dart';
import 'package:provider/provider.dart';

class SecurityPinSupportScreen extends StatefulWidget {

  static const String name = "security_pin";
  static const String path = "/$name";

  const SecurityPinSupportScreen({super.key});

  @override
  State<SecurityPinSupportScreen> createState() => _SecurityPinSupportScreenState();
}

class _SecurityPinSupportScreenState extends State<SecurityPinSupportScreen> {
  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<SecurityPinViewModel>(context,listen: false);
    final userRepository = Provider.of<UserRepository>(context,listen: false);

    Widget fieldPart = SetSecurityPinWidget(
      viewModel: viewModel,
      userRepository: userRepository,
    );

    Widget fieldPart2 = VerifySecurityPinWidget(
      viewModel: viewModel,
      userRepository: userRepository,
    );


    return  Scaffold(
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
                      setState(() {

                      });
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
                  const Expanded(flex: 3,child: SecurityPinWebPageFillerWidget()),
                  Expanded(flex:1,child: fieldPart2),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
