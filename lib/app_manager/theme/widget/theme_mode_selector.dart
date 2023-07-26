

import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/app_manager/theme/theme_provider.dart';
import 'package:provider/provider.dart';

class ThemeModeSelector extends StatelessWidget {
  const ThemeModeSelector({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final theme = Theme.of(context);
    return Wrap(
      children: [
        IconButton(onPressed: (){
          themeProvider.setThemeMode = ThemeMode.system;
        }, icon: Icon(Icons.settings_system_daydream,
        color: themeProvider.themeMode==ThemeMode.system? theme.primaryColor:null)),
        IconButton(onPressed: (){
          themeProvider.setThemeMode = ThemeMode.light;
        }, icon: Icon(Icons.light,
            color: themeProvider.themeMode==ThemeMode.light? theme.primaryColor:null)),
        IconButton(onPressed: (){
          themeProvider.setThemeMode = ThemeMode.dark;
        }, icon: Icon(Icons.dark_mode,
            color: themeProvider.themeMode==ThemeMode.dark? theme.primaryColor:null)),
      ],
    );
  }
}
