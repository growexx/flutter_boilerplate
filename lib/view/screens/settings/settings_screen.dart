import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/app_manager/component/responsive/widget/responsive_helper.dart';
import 'package:flutter_boilerplate/app_manager/helper/navigation/navigation_helper.dart';
import 'package:flutter_boilerplate/authentication/user.dart';
import 'package:flutter_boilerplate/authentication/user_repository.dart';
import 'package:flutter_boilerplate/view/screens/chat/chat_screen.dart';
import 'package:flutter_boilerplate/view/screens/dashboard/dashboard_screen.dart';
import 'package:flutter_boilerplate/view/screens/settings/widget/custom_tile.dart';
import 'package:flutter_boilerplate/view/screens/user_details_screen.dart';
import 'package:flutter_boilerplate/view/widgets/screen_text_and_theme_controller.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class SettingsPage extends StatefulWidget {
  static const String name = "settings";
  static const String path = "/$name";
  bool showButton;
  SettingsPage({super.key, this.showButton = true});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    User user = Provider.of<UserRepository>(context).getUser;
    Widget profileWidget = Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: CircleAvatar(
              backgroundImage: NetworkImage(
                  user.profileUrl ?? 'https://picsum.photos/200/300'),
              radius: 50,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Name: ${user.firstName ?? ""}  ${user.lastName ?? ""}',
                  style: const TextStyle(
                    fontSize: 18,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  'Email: ${user.email ?? ""}',
                  style: const TextStyle(
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );

    Widget settingWidget = Center(
      child: ListView(
        children: [
          profileWidget,
          Column(
            children: [
              const Text("Appearance",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  )),
              const SizedBox(
                height: 5,
              ),
              ScreenTextAndThemeController(onChange: () {
                setState(() {});
              }),
              CustomListTile(
                title: "Notifications",
                icon: Icons.notifications_none_rounded,
                onTap: () {},
              ),
              CustomListTile(
                title: "Security Status",
                icon: CupertinoIcons.lock_shield,
                onTap: () {},
              ),
            ],
          ),
          const Divider(),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomListTile(
                title: "Profile",
                icon: Icons.person_outline_rounded,
                onTap: () {
                  NavigationHelper.pushNamed(context, UserDetailsScreen.name);
                },
              ),
              CustomListTile(
                title: "Messaging",
                icon: Icons.message_outlined,
                onTap: () {
                  NavigationHelper.pushNamed(context, ChatScreen.name);
                },
              ),
              CustomListTile(
                title: "Calling",
                icon: Icons.phone_outlined,
                onTap: () {},
              ),
              CustomListTile(
                title: "Social",
                icon: Icons.contacts_outlined,
                onTap: () {},
              ),
              CustomListTile(
                title: "App Info",
                icon: Icons.info,
                onTap: () {},
              )
            ],
          ),
          const Divider(),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomListTile(
                title: "Help & Feedback",
                icon: Icons.help_outline_rounded,
                onTap: () {},
              ),
              CustomListTile(
                title: "About",
                icon: Icons.info_outline_rounded,
                onTap: () {},
              ),
              CustomListTile(
                title: "Sign out",
                icon: Icons.exit_to_app_rounded,
                onTap: () {
                  Provider.of<UserRepository>(context, listen: false)
                      .signOutUser(context);
                },
              ),
            ],
          ),
        ],
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Settings",
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        leading: widget.showButton
            ? IconButton(
                onPressed: () {
                  context.goNamed(DashboardScreen.name);
                },
                icon: const Icon(Icons.arrow_back_sharp))
            : Container(),
        automaticallyImplyLeading: true,
      ),
      body: ResponsiveHelperWidget(
        mobile: settingWidget,
        desktop: Center(
          child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 800),
              child: settingWidget),
        ),
      ),
    );
  }
}
