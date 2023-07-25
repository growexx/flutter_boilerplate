

import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/app_manager/constant/app_constant.dart';
import 'package:flutter_boilerplate/app_manager/theme/app_color.dart';

class CustomTextButtonTheme {



  static final TextButtonThemeData primary =TextButtonThemeData(
      style: TextButton.styleFrom(
          minimumSize: const Size(0,40),
          backgroundColor: AppColor.primary,
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

  static final TextButtonThemeData primaryWithRadius6 =TextButtonThemeData(
      style: TextButton.styleFrom(
          minimumSize: const Size(0,50),
          backgroundColor: AppColor.primary,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6),
              side: const BorderSide(
                  color: Colors.transparent,
                  width: 1
              )
          ),
          textStyle: const TextStyle(
            fontFamily: AppConstant.fontFamily,
            fontWeight: FontWeight.w500,
            fontSize: 14,
          ),
          padding: const EdgeInsets.all(10)
      )
  );


  static final TextButtonThemeData text =TextButtonThemeData(
      style: TextButton.styleFrom(
          minimumSize: const Size(0,22),
          foregroundColor: Colors.black.withOpacity(0.85),
          shape: _outlinedBorder,
          textStyle: const TextStyle(
            fontFamily: AppConstant.fontFamily,
              fontWeight: FontWeight.w500,
              fontSize: 14,
          ),
          padding: const EdgeInsets.all(2)
      )
  );

  static final TextButtonThemeData textP =TextButtonThemeData(
      style: TextButton.styleFrom(
          minimumSize: const Size(0,22),
          foregroundColor: AppColor.primary,
          shape: _outlinedBorder,
          textStyle: const TextStyle(
            fontFamily: AppConstant.fontFamily,
              fontWeight: FontWeight.w500,
              fontSize: 14,
          ),
          padding: const EdgeInsets.all(2)
      )
  );


  static final TextButtonThemeData greyText =TextButtonThemeData(
      style: TextButton.styleFrom(
          minimumSize: const Size(0,22),
          foregroundColor: AppColor.grey1,
          shape: _outlinedBorder,
          textStyle:  TextStyle(
            fontFamily: AppConstant.fontFamily,
            color: AppColor.grey1,
              fontWeight: FontWeight.w500,
              fontSize: 14,
          ),
          padding: const EdgeInsets.all(2)
      )
  );

  static final TextButtonThemeData white =TextButtonThemeData(
      style: TextButton.styleFrom(
          minimumSize: const Size(double.infinity,40),
          backgroundColor: Colors.white,
          foregroundColor: Colors.black.withOpacity(0.85),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(2),
              side:  BorderSide(
                  color: AppColor.grey,
                  width: 1
              )
          ),
          textStyle: const TextStyle(
            fontFamily: AppConstant.fontFamily,
              fontWeight: FontWeight.w500,
              fontSize: 14,
          ),
          padding: const EdgeInsets.all(2)
      )
  );


  static final TextButtonThemeData whiteWithPrimaryForeground =TextButtonThemeData(
      style: TextButton.styleFrom(
          minimumSize: const Size(double.infinity,40),
          backgroundColor: Colors.white,
          foregroundColor: AppColor.primary,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(2),
              side:  BorderSide(
                  color: AppColor.primary,
                  width: 1
              )
          ),
          textStyle: const TextStyle(
            fontFamily: AppConstant.fontFamily,
            fontWeight: FontWeight.w500,
            fontSize: 14,
          ),
          padding: const EdgeInsets.all(2)
      )
  );


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