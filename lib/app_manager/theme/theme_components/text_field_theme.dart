import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/app_manager/constant/app_constant.dart';
import 'package:flutter_boilerplate/app_manager/theme/app_color.dart';

class CustomTextFieldTheme {
  static final InputDecorationTheme primaryLight = _createTheme();

  static final InputDecorationTheme primaryDark = _createTheme(
    hintColor: Colors.white60,
    errorColor: Colors.white60,
  );


  static InputDecorationTheme _createTheme({
    Color? hintColor,
    Color? errorColor,
}) {

    Color hintColorForTheme = hintColor ?? hintColor?? AppColor.hintColor;

    return InputDecorationTheme(
        isDense: true,
        contentPadding: const EdgeInsets.all(12),
        labelStyle: const TextStyle(
            fontFamily: AppConstant.fontFamily,
            color: Colors.black,
            fontSize: 14,
            fontWeight: FontWeight.w500),
        hintStyle: TextStyle(
            fontFamily: AppConstant.fontFamily,
            color: hintColorForTheme,
            fontSize: 14,
            fontWeight: FontWeight.w400),
        errorStyle:  TextStyle(
            fontFamily: AppConstant.fontFamily,
            color: errorColor ?? AppColor.error,
            fontSize: 12,
            height: 1,
            fontWeight: FontWeight.w600),
        errorMaxLines: 2,
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(2),
            borderSide: BorderSide(color: hintColorForTheme, width: 1)),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(2),
            borderSide: BorderSide(color: hintColorForTheme, width: 1)));
  }


}
