import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/view/screens/user_details_screen.dart';

import '../../app_manager/helper/navigation/navigation_helper.dart';
import 'dashboard_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});
  static const String name = "mainscreen";
  static const String path = "/$name";

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;
  bool isTabBarView = true;
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
                  // NavigationHelper.pushNamed(context, UserDetailsScreen.name);
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
                leading: Icon(Icons.logout),
                title: Text('Logout'),
                onTap: () {
                  Navigator.pushReplacementNamed(context, '/login');
                },
              ),
            ],
          ),
        ),
        body: isTabBarView
            ? TabBarView(children: _screens)
            : _screens[_currentIndex],
        bottomNavigationBar: isTabBarView
            ? null
            : BottomNavigationBar(
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
              ),
      ),
    );
  }
}
