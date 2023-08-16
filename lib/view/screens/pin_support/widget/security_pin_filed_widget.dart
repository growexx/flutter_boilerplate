import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/app_manager/component/alert_dialog/alert_dialog_view.dart';
import 'package:flutter_boilerplate/app_manager/helper/navigation/navigation_helper.dart';
import 'package:flutter_boilerplate/view/screens/dashboard/dashboard_screen.dart';
import 'package:flutter_boilerplate/view_model/security_pin_view_model.dart';
import 'package:flutter_screen_lock/flutter_screen_lock.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:local_auth/local_auth.dart';

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
                          key: const Key("create_pin"),
                          onPressed: () {
                            screenLockCreate(
                                customizedButtonChild: !kIsWeb
                                    ? const Icon(Icons.fingerprint)
                                    : const SizedBox(height: 0, width: 0),
                                customizedButtonTap: () async =>
                                    await localAuth(context),
                                title: const Text(
                                  "create_security_pin",
                                  style: TextStyle(color: Colors.white),
                                ).tr(),
                                cancelButton: const Text(
                                  "cancel",
                                  style: TextStyle(color: Colors.white),
                                ).tr(),
                                context: context,
                                canCancel: true,
                                onConfirmed: (String value) {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialogView(
                                          key: const Key("security_pin_dialog"),
                                          title: 'security_pin'.tr(),
                                          message:
                                              'security_pin_description_done'.tr(),
                                          popButtonTitle: '',
                                          successButtonTitle: 'okay'.tr(),
                                          onPressFunction: () async {
                                            context.pop();
                                          });
                                    },
                                  );
                                });
                          },
                          style: TextButton.styleFrom(
                            minimumSize: const Size.fromHeight(50),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                          child: const Text("create_security_pin").tr(),
                        ),
                        const SizedBox(height: 20),
                        TextButton(
                          key: const Key("verify_pin"),
                          onPressed: () {
                            screenLock(
                                customizedButtonChild: !kIsWeb
                                    ? const Icon(Icons.fingerprint)
                                    : const SizedBox(height: 0, width: 0),
                                customizedButtonTap: () async =>
                                    await localAuth(context),
                                title: const Text(
                                  "security_pin",
                                  style: TextStyle(color: Colors.white),
                                ).tr(),
                                cancelButton: const Text(
                                  "cancel",
                                  style: TextStyle(color: Colors.white),
                                ).tr(),
                                onUnlocked: () {
                                  NavigationHelper.pushNamed(
                                      context, DashboardScreen.name);
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

  Future<void> localAuth(BuildContext context) async {
    final localAuth = LocalAuthentication();
    final didAuthenticate =
        await localAuth.authenticate(localizedReason: 'Please authenticate');
    if (didAuthenticate) {
      // ignore: use_build_context_synchronously
      Navigator.pop(context);
    }
  }
}
