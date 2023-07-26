


import 'package:flutter/material.dart';

class LocaleHelper extends ChangeNotifier{

  static const List<Locale> supportedLocales = [Locale('en', 'US'), Locale('hi', 'IN')];
  static const String path = 'assets/translations';
  static const Locale fallbackLocale = Locale('en', 'US');

}