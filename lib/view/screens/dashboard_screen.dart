



import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {

  static const String name = "dashboard";
  static const String path = "/$name";

  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Dashboard Screen"),
      ),
    );
  }
}
