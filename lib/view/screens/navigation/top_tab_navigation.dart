import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/view/screens/user_details_screen.dart';

import '../dashboard/dashboard_screen.dart';

class TopTabNavigation extends StatelessWidget {
  TopTabNavigation({super.key});
  static const String name = "top_tab_navigation";
  static const String path = "/$name";
  final List<Widget> _screens = [
    const DashboardScreen(),
    UserDetailsScreen(
      showButton: false,
    ),
    const Center(
      child: Text(
        'Settings Screen',
        style: TextStyle(fontSize: 24),
      ),
    ),
    const Center(
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
            title: const Text("Sample Header").tr(),
            bottom: const TabBar(
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
