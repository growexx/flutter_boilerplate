import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/app_manager/component/alert_dialog/alert_dialog_view.dart';
import 'package:flutter_boilerplate/app_manager/component/bottom_sheet/custom_bottom_sheet.dart';
import 'package:flutter_boilerplate/app_manager/component/bottom_sheet/functional_sheet.dart';

void showExitPopUp(BuildContext context) {
  if (kIsWeb) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialogView(
            key: const Key("exit"),
            title: 'flutter_boilerplate'.tr(),
            message: 'want-to-exit'.tr(),
            popButtonTitle: 'cancel'.tr(),
            successButtonTitle: 'exit'.tr(),
            onPressFunction: () async {
              exit(0);
            });
      },
    );
  } else {
    CustomBottomSheet.open(context,
        child: FunctionalSheet(
            message: "want_to_exit".tr(),
            buttonName: "exit".tr(),
            onPressButton: () async {
              exit(0);
            }));
  }
}
