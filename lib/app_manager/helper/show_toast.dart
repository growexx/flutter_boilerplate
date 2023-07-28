import 'package:flutter/foundation.dart';

void showToast(String msg) {
  try {
   /* Fluttertoast.showToast(
      msg: msg,
    );*/
  } catch (e) {
    if (kDebugMode) {
      print(e);
    }
  }
}
