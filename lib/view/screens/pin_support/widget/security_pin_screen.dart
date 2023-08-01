import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/app_manager/component/responsive/widget/responsive_helper.dart';
import 'package:flutter_boilerplate/app_manager/locale/widget/locale_selector_widget.dart';
import 'package:flutter_boilerplate/app_manager/theme/widget/theme_mode_selector.dart';
import 'package:flutter_boilerplate/view/screens/pin_support/widget/security_pin_filed_widget.dart';
import 'package:flutter_boilerplate/view/widgets/welcome.dart';

class SecurityPinScreen extends StatefulWidget {

  static const String name = "security_pin";
  static const String path = "/$name";

  const SecurityPinScreen({super.key});

  @override
  State<SecurityPinScreen> createState() => _SecurityPinScreenState();
}

class _SecurityPinScreenState extends State<SecurityPinScreen> {
  @override
  Widget build(BuildContext context) {

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
        const Expanded(
          child: SecurityPinFieldWidget(),
        ),
      ],
    );

    return  Scaffold(
      body: ResponsiveHelperWidget(
        mobile: fieldPart,
        desktop: Row(
          children: [
            const Expanded(flex: 3,child: WelcomeWidget()),
            SizedBox(
                width: 440,
                child: fieldPart),
          ],
        ),
      ),
    );
  }
}
