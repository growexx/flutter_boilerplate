import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/app_manager/service/navigation_service.dart';

void showToast(String msg) {
  try {
      var snackBar = SnackBar(
        content: Text(msg),
      );
      ScaffoldMessenger.of(NavigationService.context!).showSnackBar(snackBar);

  } catch (e) {
    if (kDebugMode) {
      print(e);
    }
  }
}
