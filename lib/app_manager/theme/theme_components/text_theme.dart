import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/app_manager/constant/app_constant.dart';
import 'package:flutter_boilerplate/app_manager/theme/app_color.dart';

class CustomTextTheme {
  static final TextTheme primaryLight = _createTextTheme();

  static final TextTheme primaryDark = _createTextTheme(primaryColor: Colors.white);

  static TextTheme _createTextTheme({
    Color? primaryColor
}) {
    Color primaryColorForTheme = primaryColor?? Colors.black;
    return TextTheme(
      headlineSmall: TextStyle(
        fontFamily: AppConstant.fontFamily,
        fontSize: 20,
        fontWeight: FontWeight.w500,
        color: primaryColorForTheme.withOpacity(0.85),
      ),
      headlineMedium: TextStyle(
        fontFamily: AppConstant.fontFamily,
        fontSize: 30,
        fontWeight: FontWeight.w500,
        color: primaryColorForTheme.withOpacity(0.85),
      ),
      titleSmall: TextStyle(
        fontFamily: AppConstant.fontFamily,
        fontSize: 14,
        fontWeight: FontWeight.w600,
        color: AppColor.grey1,
      ),
      titleMedium: TextStyle(
        fontFamily: AppConstant.fontFamily,
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: primaryColorForTheme.withOpacity(0.85),
      ),
      bodyMedium: TextStyle(
        fontFamily: AppConstant.fontFamily,
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: primaryColorForTheme.withOpacity(0.85),
      ),
    );
  }


}