import 'package:flutter/foundation.dart';

void showToast(String msg) {
  try {
    /*var snackBar = SnackBar(
      content: Text(msg),
    );*/
    //ScaffoldMessenger.of(context).showSnackBar(snackBar);
  } catch (e) {
    if (kDebugMode) {
      print(e);
    }
  }
}
