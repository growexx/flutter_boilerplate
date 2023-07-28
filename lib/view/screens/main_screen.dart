import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/view/screens/user_details_screen.dart';

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
  int _currentIndex = 0;
  bool isTabBarView = false;
  bool isDrawerNav = true;
  final List<Widget> _screens = [
    DashboardScreen(),
    // UserDetailsScreen(
    //   username: 'John Doe',
    //   email: 'johndoe@example.com',
    //   profileImageUrl: 'https://example.com/profile_image.png',
    // ),
    Center(
      child: Text(
        'Profile Screen',
        style: TextStyle(fontSize: 24),
      ),
    ),
    Center(
      child: Text(
        'Settings Screen',
        style: TextStyle(fontSize: 24),
      ),
    ),
    Center(
      child: Text(
        'Chat Screen',
        style: TextStyle(fontSize: 24),
      ),
    ),
  ];

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
                child: Text('drawer_navigation').tr(),
              ),
              MaterialButton(
                onPressed: () {
                  NavigationHelper.pushNamed(context, TopTabNavigation.name);
                },
                child: Text('top_tab_navigation').tr(),
              ),
              MaterialButton(
                onPressed: () {
                  NavigationHelper.pushNamed(context, BottomTabNavigation.name);
                },
                child: Text('bottom_tab_navigation').tr(),
              )
            ],
          ),
        )),
      ),
    );
  }
}
