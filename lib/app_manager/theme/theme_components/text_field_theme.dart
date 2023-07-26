import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/app_manager/constant/app_constant.dart';
import 'package:flutter_boilerplate/app_manager/theme/app_color.dart';

class CustomTextFieldTheme {
  static final InputDecorationTheme primary = InputDecorationTheme(
      isDense: true,
      contentPadding: const EdgeInsets.all(12),
      labelStyle: const TextStyle(
          fontFamily: AppConstant.fontFamily,
          color: Colors.black,
          fontSize: 14,
          fontWeight: FontWeight.w500),
      hintStyle: TextStyle(
          fontFamily: AppConstant.fontFamily,
          color: AppColor.hintColor,
          fontSize: 14,
          fontWeight: FontWeight.w400),
      errorStyle:  TextStyle(
          fontFamily: AppConstant.fontFamily,
          color: AppColor.error,
          fontSize: 12,
          height: 1,
          fontWeight: FontWeight.w600),
      errorMaxLines: 2,
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(2),
          borderSide: BorderSide(color: AppColor.hintColor, width: 1)),
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(2),
          borderSide: BorderSide(color: AppColor.hintColor, width: 1)));

  /// Uncomment for adding second textField theme

  // static final InputDecorationTheme secondary = InputDecorationTheme(
  //     isDense: true,
  //     contentPadding: const EdgeInsets.fromLTRB(12, 10, 12, 10),
  //     labelStyle: const TextStyle(
  //fontFamily: AppConstant.fontFamily,
  //         color: Colors.black,
  //         fontSize: 14,
  //         fontWeight: FontWeight.w500
  //     ),
  //     hintStyle:  TextStyle(
  //fontFamily: AppConstant.fontFamily,
  //         color: Colors.white.withOpacity(0.25),
  //         fontSize: 16,
  //         fontWeight: FontWeight.w400
  //     ),
  //     prefixIconColor: Colors.white,
  //     enabledBorder: OutlineInputBorder(
  //         borderRadius: BorderRadius.circular(6),
  //         borderSide: BorderSide(
  //             color: Colors.white.withOpacity(0.4),
  //             width: 1
  //         )
  //     ),
  //     focusedBorder: OutlineInputBorder(
  //         borderRadius: BorderRadius.circular(6),
  //         borderSide: const BorderSide(
  //             color: Colors.white,
  //             width: 1
  //         )
  //     ),
  //     border: OutlineInputBorder(
  //         borderRadius: BorderRadius.circular(6),
  //         borderSide: BorderSide(
  //             color: Colors.white.withOpacity(0.4),
  //             width: 1
  //         )
  //     )
  // );
}
