import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/view/screens/chat/recent_chats.dart';
import 'package:flutter_boilerplate/view/screens/settings/settings_screen.dart';
import 'package:flutter_boilerplate/view/screens/user_details_screen.dart';
import 'package:provider/provider.dart';

import '../../../view_model/veiw_model.dart';
import '../dashboard/dashboard_screen.dart';

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
    const DashboardScreen(),
    UserDetailsScreen(
      showButton: false,
    ),
    const SettingsPage(),
    ChangeNotifierProvider<ChatViewModel>(
      create: (_) => ChatViewModel(),
      child: const RecentChats(autoShowBackButton: false),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return DefaultTabController(
      length: 4, // Number of tabs
      child: Scaffold(
          appBar: AppBar(
            title: Text("flutter_boilerplate", style: theme.textTheme.headlineSmall,).tr(),
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
            items: const [
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
