import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/view/screens/main_screen.dart';
import 'package:flutter_boilerplate/view/screens/user_details_screen.dart';

import '../../../app_manager/helper/navigation/navigation_helper.dart';
import '../dashboard_screen.dart';

class DrawerNavigation extends StatefulWidget {
  const DrawerNavigation({super.key});
  static const String name = "drawer_navigation";
  static const String path = "/$name";

  @override
  State<DrawerNavigation> createState() => _DrawerNavigationState();
}

class _DrawerNavigationState extends State<DrawerNavigation> {
  bool isDrawerNav = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Sample Header").tr(),
          automaticallyImplyLeading: isDrawerNav,
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
                child: Text(
                  'Drawer Header',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ),
              ListTile(
                leading: Icon(Icons.person),
                title: Text('User profile'),
                onTap: () {
                  // Navigate to the home screen or perform any action
                  NavigationHelper.pushNamed(context, UserDetailsScreen.name);
                },
              ),
              ListTile(
                leading: Icon(Icons.settings),
                title: Text('Settings'),
                onTap: () {
                  // Navigate to the settings screen or perform any action
                },
              ),
              Divider(),
              ListTile(
                leading: Icon(Icons.screenshot_rounded),
                title: Text('Main Screen'),
                onTap: () {
                  NavigationHelper.pushNamed(context, MainScreen.name);
                },
              ),
              Divider(),
              ListTile(
                leading: Icon(Icons.logout),
                title: Text('Logout'),
                onTap: () {
                  Navigator.pushReplacementNamed(context, '/login');
                },
              ),
            ],
          ),
        ),
        body: DashboardScreen());
  }
}
