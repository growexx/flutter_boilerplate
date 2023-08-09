import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../view_model/chat_view_model.dart';
import '../screens.dart';

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
            title: Text("flutter_boilerplate",
                    style: theme.textTheme.headlineSmall)
                .tr(),
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
