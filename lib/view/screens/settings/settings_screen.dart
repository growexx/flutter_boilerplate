import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/view/screens/settings/widget/custom_tile.dart';

class SettingsPage extends StatefulWidget {
   static const String name = "settings";
  static const String path = "/$name";
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _isDark = false;
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: _isDark ? ThemeData.dark() : ThemeData.light(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Settings"),
        ),
        body: Center(
          child: Container(
            constraints: const BoxConstraints(maxWidth: 400),
            child: ListView(
              children: [
                _SingleSection(
                  title: "General",
                  children: [
                    CustomListTile(
                        title: "Dark Mode",
                        icon: Icons.dark_mode_outlined,
                        trailing: Switch(
                            value: _isDark,
                            onChanged: (value) {
                              setState(() {
                                _isDark = value;
                              });
                            })),
                    const CustomListTile(
                        title: "Notifications",
                        icon: Icons.notifications_none_rounded),
                    const CustomListTile(
                        title: "Security Status",
                        icon: CupertinoIcons.lock_shield),
                  ],
                ),
                const Divider(),
                const _SingleSection(
                  title: "Organization",
                  children: [
                    CustomListTile(
                        title: "Profile", icon: Icons.person_outline_rounded),
                    CustomListTile(
                        title: "Messaging", icon: Icons.message_outlined),
                    CustomListTile(
                        title: "Calling", icon: Icons.phone_outlined),
                    CustomListTile(
                        title: "People", icon: Icons.contacts_outlined),
                    CustomListTile(
                        title: "Calendar", icon: Icons.calendar_today_rounded)
                  ],
                ),
                const Divider(),
                const _SingleSection(
                  children: [
                    CustomListTile(
                        title: "Help & Feedback",
                        icon: Icons.help_outline_rounded),
                    CustomListTile(
                        title: "About", icon: Icons.info_outline_rounded),
                    CustomListTile(
                        title: "Sign out", icon: Icons.exit_to_app_rounded),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


class _SingleSection extends StatelessWidget {
  final String? title;
  final List<Widget> children;
  const _SingleSection({
    Key? key,
    this.title,
    required this.children,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title != null)
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              title!,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
        Column(
          children: children,
        ),
      ],
    );
  }
}
