import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/app_manager/component/responsive/widget/responsive_helper.dart';
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

    Widget fieldPart = const Column(
      children: [
        Expanded(
          child: SecurityPinFieldWidget(),
        ),
      ],
    );

    return  Scaffold(
      key: const Key("sf_widget"),
      body: ResponsiveHelperWidget(
        mobile: fieldPart,
        desktop: Row(
          key: const Key("row"),
          children: [
            const Expanded(flex: 3,child: WelcomeWidget(
              key:Key("welcome_widget"),
            )),
            SizedBox(
                key:const Key("filedPart"),
                width: 440,
                child: fieldPart),
          ],
        ),
      ),
    );
  }
}
