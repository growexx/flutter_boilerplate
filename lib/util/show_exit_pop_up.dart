


import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_boilerplate/app_manager/component/bottom_sheet/custom_bottom_sheet.dart';
import 'package:flutter_boilerplate/app_manager/component/bottom_sheet/functional_sheet.dart';

void showExitPopUp (BuildContext context){
  CustomBottomSheet.open(context,
      child: FunctionalSheet(
          message: "want_to_exit".tr(),
          buttonName: "exit".tr(),
          onPressButton: () async {
            exit(0);
          }));
}