import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/view/screens/payment/payment_screen.dart';
import 'package:flutter_boilerplate/view/screens/edit_profile/editprofile_screen.dart';
import 'package:flutter_boilerplate/authentication/user.dart';
import 'package:flutter_boilerplate/authentication/user_repository.dart';
import 'package:flutter_boilerplate/view/screens/todo/screen/todo_list_screen.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';

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
        body: Column(
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
                              const Text(key: Key("welcome"), "welcome").tr(),
                              Text(currentUser?.firstName ?? ""),
                            ],
                          );
                        }),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Wrap(
                      children: [
                        const SizedBox(width: 10),
                        TextButton(
                            key: const Key("change_password"),
                            onPressed: () {
                              userRepository.changePassword(context);
                            },
                            child: const Text("change_password").tr()),
                        const SizedBox(width: 10),
                        TextButton(
                            key: const Key("sign_out"),
                            onPressed: () {
                              userRepository.signOutUser(context);
                            },
                            child: const Text("sign_out").tr()),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Center(
                child: const Text("dashboard_screen").tr(),
              ),
            ),
            Expanded(
              child: Center(
                  child: TextButton(
                      key: const Key("payment"),
                      onPressed: () {
                        context.goNamed(PaymentScreen.name);
                      },
                      child: const Text("payment").tr())),
            ),
            Expanded(
              child: Center(
                child: TextButton(
                    key:const Key("editprofile"),
                    onPressed: (){
                         context.goNamed(
                             EditProfileScreen.name
                          );
                    }, child: const Text("editprofile").tr())
              ),
            ),
            Expanded(
              child: Center(
                child: TextButton(
                    key:const Key("todo_screen"),
                    onPressed: (){
                         context.goNamed(
                             TodoListScreen.name
                          );
                    }, child: const Text("todo_screen").tr())
              ),
            ),
          ],
        ),
      ),
    );
  }
}
