import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/app_manager/constant/app_constant.dart';
import 'package:flutter_boilerplate/app_manager/theme/app_color.dart';

class CustomElevatedButtonTheme {
  static final ElevatedButtonThemeData primaryLight = _createElevatedButtonThemeData();
  static final ElevatedButtonThemeData primaryDark = _createElevatedButtonThemeData(
      primaryColor: AppColor.primary.withOpacity(0.7)
  );
  
  static ElevatedButtonThemeData _createElevatedButtonThemeData({
    Color? primaryColor
}) {
    Color primaryColorForTheme = primaryColor ?? AppColor.primary;
    return ElevatedButtonThemeData(
        style: TextButton.styleFrom(
            minimumSize: const Size(0,40),
            backgroundColor: primaryColorForTheme,
            foregroundColor: Colors.white,
            shape: _outlinedBorder,
            textStyle: const TextStyle(
              fontFamily: AppConstant.fontFamily,
              fontWeight: FontWeight.w500,
              fontSize: 14,
            ),
            padding: const EdgeInsets.all(10)
        )
    );
  }

  static final ElevatedButtonThemeData grey =ElevatedButtonThemeData(
      style: TextButton.styleFrom(
          minimumSize: const Size(0,40),
          backgroundColor: AppColor.grey2,
          foregroundColor: Colors.black.withOpacity(0.85),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(2),
              side:  BorderSide(
                  color: AppColor.grey2,
                  width: 1
              )
          ),
          textStyle: const TextStyle(
            fontFamily: AppConstant.fontFamily,
              fontWeight: FontWeight.w500,
              fontSize: 14,
          ),
          padding: const EdgeInsets.all(13)
      )
  );


  static final OutlinedBorder _outlinedBorder = RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(2),
    side: const BorderSide(
      color: Colors.transparent,
      width: 1
    )
  );
}