



import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {

  static const String name = "dashboard";
  static const String path = "/$name";

  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: const Text("dashboard_screen").tr(),
      ),
    );
  }
}
