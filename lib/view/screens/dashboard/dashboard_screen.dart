import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/app_manager/helper/navigation/navigation_helper.dart';
import 'package:flutter_boilerplate/view/screens/google_map/google_map_screen.dart';
import 'package:flutter_boilerplate/view/screens/payment/payment_screen.dart';
import 'package:flutter_boilerplate/view/screens/edit_profile/editprofile_screen.dart';
import 'package:flutter_boilerplate/authentication/user.dart';
import 'package:flutter_boilerplate/authentication/user_repository.dart';
import 'package:flutter_boilerplate/view/screens/pin_support/pin_support.dart';
import 'package:flutter_boilerplate/view/screens/todo/screen/todo_list_screen.dart';
import 'package:provider/provider.dart';

import '../../../app_manager/component/bottom_sheet/custom_bottom_sheet.dart';
import '../../../app_manager/component/bottom_sheet/functional_sheet.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  static const String name = "dashboard";
  static const String path = "/$name";

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final UserRepository userRepository =
        Provider.of<UserRepository>(context, listen: false);
    return WillPopScope(
      onWillPop: () {
        CustomBottomSheet.open(context,
            child: FunctionalSheet(
                message: "want_to_exit".tr(),
                buttonName: "exit".tr(),
                onPressButton: () async {
                  exit(0);
                }));
        return Future.value(true);
      },
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Selector<UserRepository, User?>(
                          shouldRebuild: (prev, nex) => true,
                          selector: (buildContext, vm) => vm.currentUser,
                          builder: (context, User? currentUser, child) {
                            return Wrap(
                              spacing: 5,
                              children: [
                                Text(
                                        key: const Key("welcome"),
                                        "welcome",
                                        style: theme.textTheme.headlineSmall)
                                    .tr(),
                                Text(currentUser?.firstName ?? ""),
                              ],
                            );
                          }),
                    ),
                  ],
                ),
              ),
              Center(
                child: Text("dashboard_screen",
                        style: theme.textTheme.headlineMedium)
                    .tr(),
              ),
              const SizedBox(
                height: 50,
              ),
              SizedBox(
                width: 300,
                child: Center(
                  child: TextButton(
                    key: const Key("change_password"),
                    onPressed: () async {
                      userRepository.changePassword(context);
                    },
                    style: TextButton.styleFrom(
                      minimumSize: const Size.fromHeight(50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    child: const Text("change_password").tr(),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                width: 300,
                child: Center(
                  child: TextButton(
                    key: const Key("payment"),
                    onPressed: () async {
                      NavigationHelper.pushNamed(context, PaymentScreen.name);
                    },
                    style: TextButton.styleFrom(
                      minimumSize: const Size.fromHeight(50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    child: const Text("payment").tr(),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                width: 300,
                child: Center(
                  child: TextButton(
                    key: const Key("editprofile"),
                    onPressed: () async {
                      NavigationHelper.pushNamed(
                          context, EditProfileScreen.name);
                    },
                    style: TextButton.styleFrom(
                      minimumSize: const Size.fromHeight(50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    child: const Text("editprofile").tr(),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                width: 300,
                child: Center(
                    child: TextButton(
                  key: const Key("todo_screen"),
                  onPressed: () async {
                    NavigationHelper.pushNamed(context, TodoListScreen.name);
                  },
                  style: TextButton.styleFrom(
                    minimumSize: const Size.fromHeight(50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  child: const Text("todo_screen").tr(),
                )),
              ),
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                width: 300,
                child: Center(
                    child: TextButton(
                  key: const Key("show_google_map"),
                  onPressed: () async {
                    NavigationHelper.pushNamed(context, GoogleMapScreen.name);
                  },
                  style: TextButton.styleFrom(
                    minimumSize: const Size.fromHeight(50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  child: const Text("show_google_map").tr(),
                )),
              ),
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                width: 300,
                child: Center(
                    child: TextButton(
                  key: const Key("show_security_pin"),
                  onPressed: () async {
                    NavigationHelper.pushNamed(context, SecurityPinScreen.name);
                  },
                  style: TextButton.styleFrom(
                    minimumSize: const Size.fromHeight(50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  child: const Text("show_security_pin").tr(),
                )),
              ),
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                width: 300,
                child: Center(
                    child: TextButton(
                  key: const Key("sign_out"),
                  onPressed: () async {
                    userRepository.signOutUser(context);
                  },
                  style: TextButton.styleFrom(
                    elevation: 0.9,
                    minimumSize: const Size.fromHeight(50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  child: const Text("sign_out").tr(),
                )),
              ),
              const SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
