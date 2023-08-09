import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/app_manager/helper/navigation/navigation_helper.dart';
import 'package:flutter_boilerplate/view/screens/dashboard/dashboard_screen.dart';
import 'package:flutter_boilerplate/view_model/security_pin_view_model.dart';
import 'package:flutter_screen_lock/flutter_screen_lock.dart';
import 'package:provider/provider.dart';

class SecurityPinFieldWidget extends StatefulWidget {
  const SecurityPinFieldWidget({super.key});

  @override
  State<SecurityPinFieldWidget> createState() => _SecurityPinFieldWidgetState();
}

class _SecurityPinFieldWidgetState extends State<SecurityPinFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return Consumer<SecurityPinViewModel>(
      builder: (BuildContext context, viewModel, Widget? child) {
        return Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 400),
                child: Form(
                  child: Builder(builder: (ctx) {
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TextButton(
                          key: const Key("verify_pin"),
                          onPressed: () {
                            screenLock(
                                title: const Text(
                                  "security_pin",
                                  style: TextStyle(color: Colors.white),
                                ).tr(),
                                cancelButton: const Text(
                                  "cancel",
                                  style: TextStyle(color: Colors.white),
                                ).tr(),
                                onUnlocked: () {
                                  NavigationHelper.pushNamed(context, DashboardScreen.name);
                                },
                                context: context,
                                correctString: "1234",
                                canCancel: true);
                          },
                          style: TextButton.styleFrom(
                            minimumSize: const Size.fromHeight(50),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                          child: const Text("verify_pin").tr(),
                        ),
                      ],
                    );
                  }),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
