import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/view/screens/navigation_screen.dart';
import 'package:flutter_boilerplate/view/screens/user_details_screen.dart';

import '../../../app_manager/helper/navigation/navigation_helper.dart';
import '../dashboard/dashboard_screen.dart';
import '../signin/signin_screen.dart';

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
        key: const Key('scaffold-key'),
        appBar: AppBar(
          title: const Text("Sample Header").tr(),
          automaticallyImplyLeading: isDrawerNav,
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              const DrawerHeader(
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
                key: const Key('user-profile-key'),
                leading: const Icon(Icons.person),
                title: const Text('User profile'),
                onTap: () {
                  // Navigate to the home screen or perform any action
                  NavigationHelper.pushNamed(context, UserDetailsScreen.name);
                },
              ),
              ListTile(
                key: const Key('settings-key'),
                leading: const Icon(Icons.settings),
                title: const Text('Settings'),
                onTap: () {
                  // Navigate to the settings screen or perform any action
                },
              ),
              const Divider(),
              ListTile(
                key: const Key('navigation-screen-key'),
                leading: const Icon(Icons.screenshot_rounded),
                title: const Text('Navigation Screen'),
                onTap: () {
                  NavigationHelper.pushNamed(context, NavigationScreen.name);
                },
              ),
              const Divider(),
              ListTile(
                key: const Key('logout-key'),
                leading: const Icon(Icons.logout),
                title: const Text('Logout'),
                onTap: () {
                  NavigationHelper.pushNamed(context, SignInScreen.name);
                },
              ),
            ],
          ),
        ),
        body: const DashboardScreen());
  }
}
