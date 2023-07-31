import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../app_manager/component/bottom_sheet/custom_bottom_sheet.dart';
import '../../app_manager/component/bottom_sheet/functional_sheet.dart';
import '../../app_manager/helper/navigation/navigation_helper.dart';
import 'dashboard_screen.dart';
import 'navigation/bottom_tab_navigation.dart';
import 'navigation/drawer_navigation.dart';
import 'navigation/top_tab_navigation.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});
  static const String name = "mainscreen";
  static const String path = "/$name";

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        CustomBottomSheet.open(context,
            child: FunctionalSheet(
                message: "Do you want to exit the app?",
                buttonName: "exit",
                onPressButton: () async {
                  exit(0);
                }));
        return Future.value(true);
      },
      child: DefaultTabController(
        length: 4, // Number of tabs
        child: Scaffold(
            body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MaterialButton(
                onPressed: () {
                  NavigationHelper.pushNamed(context, DrawerNavigation.name);
                },
                child: const Text('drawer_navigation').tr(),
              ),
              MaterialButton(
                onPressed: () {
                  NavigationHelper.pushNamed(context, TopTabNavigation.name);
                },
                child: const Text('top_tab_navigation').tr(),
              ),
              MaterialButton(
                onPressed: () {
                  NavigationHelper.pushNamed(context, BottomTabNavigation.name);
                },
                child: const Text('bottom_tab_navigation').tr(),
              )
            ],
          ),
        )),
      ),
    );
  }
}
