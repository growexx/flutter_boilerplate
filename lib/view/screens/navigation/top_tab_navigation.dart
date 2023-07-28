import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/view/screens/user_details_screen.dart';

import '../../../app_manager/helper/navigation/navigation_helper.dart';
import '../dashboard_screen.dart';

class TopTabNavigation extends StatefulWidget {
  const TopTabNavigation({super.key});
  static const String name = "top_tab_navigation";
  static const String path = "/$name";

  @override
  State<TopTabNavigation> createState() => _TopTabNavigationState();
}

class _TopTabNavigationState extends State<TopTabNavigation> {
  int _currentIndex = 0;
  final List<Widget> _screens = [
    DashboardScreen(),
    UserDetailsScreen(
      username: 'John Doe',
      email: 'johndoe@example.com',
      profileImageUrl: 'https://example.com/profile_image.png',
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
    return DefaultTabController(
      length: 4, // Number of tabs
      child: Scaffold(
          appBar: AppBar(
            title: Text("Sample Header").tr(),
            bottom: TabBar(
              indicatorSize: TabBarIndicatorSize.tab,
              tabs: [
                Tab(
                  child: Icon(Icons.dashboard),
                ),
                Tab(icon: Icon(Icons.person)),
                Tab(icon: Icon(Icons.settings)),
                Tab(icon: Icon(Icons.chat)),
              ],
            ),
          ),
          body: TabBarView(children: _screens)),
    );
  }
}
