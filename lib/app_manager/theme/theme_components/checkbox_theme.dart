import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/app_manager/theme/app_color.dart';

class CustomCheckBoxTheme {
  static final CheckboxThemeData primaryLight = CheckboxThemeData(
      fillColor: MaterialStateProperty.all<Color>(AppColor.primary),
      checkColor: MaterialStateProperty.all<Color>(AppColor.white));
  static final CheckboxThemeData primaryDark = CheckboxThemeData(
      fillColor: MaterialStateProperty.all<Color>(AppColor.secondary),
      checkColor: MaterialStateProperty.all<Color>(AppColor.white));
}
