

import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/app_manager/constant/app_constant.dart';
import 'package:flutter_boilerplate/app_manager/theme/app_color.dart';
import 'package:flutter_boilerplate/app_manager/theme/app_color.dart';

class CustomTextButtonTheme {



  static final CheckboxThemeData primaryLight =CheckboxThemeData(


  );
  static final TextButtonThemeData primaryDark =TextButtonThemeData(
      style: TextButton.styleFrom(
          minimumSize: const Size(0,40),
          backgroundColor: AppColor.secondary,
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



  // static final TextButtonThemeData text =TextButtonThemeData(
  //     style: TextButton.styleFrom(
  //         minimumSize: const Size(0,22),
  //         foregroundColor: Colors.black.withOpacity(0.85),
  //         shape: _outlinedBorder,
  //         textStyle: const TextStyle(
  //           fontFamily: AppConstant.fontFamily,
  //             fontWeight: FontWeight.w500,
  //             fontSize: 14,
  //         ),
  //         padding: const EdgeInsets.all(2)
  //     )
  // );


  static final TextButtonThemeData grey =TextButtonThemeData(
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