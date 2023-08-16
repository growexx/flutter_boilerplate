import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/authentication/user.dart';
import 'package:flutter_boilerplate/authentication/user_repository.dart';
import 'package:flutter_boilerplate/view/screens/navigation_screen.dart';
import 'package:flutter_boilerplate/view/screens/settings/settings_screen.dart';
import 'package:flutter_boilerplate/view/screens/user_details_screen.dart';
import 'package:flutter_boilerplate/view/widgets/screen_text_and_theme_controller.dart';
import 'package:provider/provider.dart';

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
    final theme = Theme.of(context);
    Widget controlBar = ScreenTextAndThemeController(onChange: () {
      setState(() {});
    });
    return Scaffold(
        key: const Key('scaffold-key'),
        appBar: AppBar(
          title:
              Text("flutter_boilerplate", style: theme.textTheme.headlineSmall)
                  .tr(),
          automaticallyImplyLeading: isDrawerNav,
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                  decoration: const BoxDecoration(
                    color: Colors.blue,
                  ),
                  child: Selector<UserRepository, User?>(
                      shouldRebuild: (prev, nex) => true,
                      selector: (buildContext, vm) => vm.currentUser,
                      builder: (context, User? currentUser, child) {
                        print('-----------------------${currentUser?.id}');
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                                    key: const Key("welcome"),
                                    "welcome",
                                    style: theme.textTheme.headlineSmall)
                                .tr(),
                            const SizedBox(
                              height: 20,
                            ),
                            currentUser?.firstName != null
                                ? Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                        currentUser?.profileUrl != null
                                            ? CircleAvatar(
                                                key: const Key(
                                                    "circle_avatar_picked_image_web"),
                                                backgroundImage: NetworkImage(
                                                    currentUser!.profileUrl ??
                                                        ""),
                                                radius: 25.0,
                                              )
                                            : Container(),
                                        const SizedBox(
                                          width: 15,
                                        ),
                                        Text(
                                            textAlign: TextAlign.center,
                                            "${currentUser?.firstName} ${currentUser?.lastName}",
                                            style:
                                                theme.textTheme.headlineSmall),
                                      ])
                                : Container(),
                          ],
                        );
                      })),
              controlBar,
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
                  NavigationHelper.pushNamed(context, SettingsPage.name);
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
