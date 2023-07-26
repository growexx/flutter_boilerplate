import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/app_manager/theme/theme_provider.dart';
import 'package:provider/provider.dart';

InputDecoration buildInputDecoration(String label, String hintText, BuildContext context) {
  final themeProvider = Provider.of<ThemeProvider>(context);
  final theme = Theme.of(context);
  return InputDecoration(
      fillColor: Colors.white,
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Colors.blue),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(25),
        borderSide: BorderSide(color: Colors.primaries.first, width: 2.0),
      ),
      labelText: label.tr(),
      hintText: hintText);
}
