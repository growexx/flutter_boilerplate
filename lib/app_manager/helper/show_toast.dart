
import 'package:flutter/foundation.dart';
import 'package:fluttertoast/fluttertoast.dart';

void showToast(String msg) {
  try {
    Fluttertoast.showToast(
        msg: msg,
    );
  } catch(e) {
    if (kDebugMode) {
      print(e);
    }
  }
}

