import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/view/screens/user_details_screen.dart';

import '../../../app_manager/helper/navigation/navigation_helper.dart';
import '../dashboard_screen.dart';

class BottomTabNavigation extends StatefulWidget {
  const BottomTabNavigation({super.key});
  static const String name = "bottom_tab_navigation";
  static const String path = "/$name";

  @override
  State<BottomTabNavigation> createState() => _BottomTabNavigationState();
}

class _BottomTabNavigationState extends State<BottomTabNavigation> {
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
          ),
          body: _screens[_currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: Colors.blue,
            selectedItemColor: Colors.blue,
            unselectedItemColor: Colors.black,
            currentIndex: _currentIndex,
            onTap: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.dashboard),
                label: 'Dashboard',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'User Profile',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                label: 'Settings',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.chat),
                label: 'Chats',
              ),
            ],
          )),
    );
  }
}
