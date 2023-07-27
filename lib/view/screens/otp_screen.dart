import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/app_manager/locale/widget/locale_selector_widget.dart';
import 'package:flutter_boilerplate/app_manager/theme/widget/theme_mode_selector.dart';
import 'package:flutter_boilerplate/view/widgets/login_widget.dart';
import 'package:flutter_boilerplate/view/widgets/otp_widget.dart';

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
    final theme = Theme.of(context);
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Align(
              alignment: Alignment.topLeft,
              child: GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Icon(
                  color:theme.iconTheme.color,
                  Icons.arrow_back,
                  size: 32,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 18,
          ),
          const Expanded(
            child: Center(
              child: SingleChildScrollView(
                child: OTPWidget(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
