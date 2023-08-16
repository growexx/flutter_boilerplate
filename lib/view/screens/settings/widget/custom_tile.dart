
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class CustomListTile extends StatelessWidget {
  final String title;
  final IconData icon;
  final Widget? trailing;
  final VoidCallback onTap;
  const CustomListTile(
      {Key? key, required this.title, required this.icon, this.trailing, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title).tr(),
      leading: Icon(icon),
      trailing: trailing,
      onTap: onTap,
    );
  }
}