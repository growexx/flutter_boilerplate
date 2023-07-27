import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/app_manager/constant/app_constant.dart';
import 'package:flutter_boilerplate/app_manager/theme/app_color.dart';

class CustomTextTheme {
  static final TextTheme primaryLight = TextTheme(
    headlineSmall: TextStyle(
      fontFamily: AppConstant.fontFamily,
      fontSize: 20,
      fontWeight: FontWeight.w500,
      color: Colors.black.withOpacity(0.85),
    ),
    headlineMedium: TextStyle(
      fontFamily: AppConstant.fontFamily,
      fontSize: 30,
      fontWeight: FontWeight.w500,
      color: Colors.black.withOpacity(0.85),
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
      color: Colors.black.withOpacity(0.85),
    ),
    bodyMedium: TextStyle(
      fontFamily: AppConstant.fontFamily,
      fontSize: 14,
      fontWeight: FontWeight.w500,
      color: Colors.black.withOpacity(0.85),
    ),
  );

  static final TextTheme primaryDark = TextTheme(
    headlineSmall: TextStyle(
      fontFamily: AppConstant.fontFamily,
      fontSize: 20,
      fontWeight: FontWeight.w500,
      color: Colors.white.withOpacity(0.85),
    ),
    headlineMedium: TextStyle(
      fontFamily: AppConstant.fontFamily,
      fontSize: 30,
      fontWeight: FontWeight.w500,
      color: Colors.white.withOpacity(0.85),
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
      color: Colors.white.withOpacity(0.85),
    ),
    bodyMedium: TextStyle(
      fontFamily: AppConstant.fontFamily,
      fontSize: 14,
      fontWeight: FontWeight.w500,
      color: Colors.white.withOpacity(0.85),
    ),
  );
}
