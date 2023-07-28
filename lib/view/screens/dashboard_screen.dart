import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/view/screens/user_details_screen.dart';

import '../../app_manager/helper/navigation/navigation_helper.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});
  static const String name = "dashboard";
  static const String path = "/$name";

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Welcome to the Dashboard!',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
