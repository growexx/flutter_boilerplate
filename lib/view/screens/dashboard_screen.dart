
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/authentication/user.dart';
import 'package:flutter_boilerplate/authentication/user_repository.dart';
import 'package:provider/provider.dart';

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
    return Scaffold(
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
                            const Text("Welcome"),
                            Text(currentUser?.firstName ?? ""),
                          ],
                        );
                      }),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                      onPressed: () {
                        userRepository.signOutUser(context);
                      },
                      child: const Text("Sign out")),
                ),
              ],
            ),
          ),
          Expanded(
            child: Center(
              child: const Text("dashboard_screen").tr(),
            ),
          ),
        ],
      ),
    );
  }
}