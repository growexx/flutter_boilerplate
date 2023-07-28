import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/app_manager/constant/app_constant.dart';
import 'package:flutter_boilerplate/app_manager/service/navigation_service.dart';
import 'package:flutter_boilerplate/app_manager/theme/app_color.dart';
import 'package:fluttertoast/fluttertoast.dart';

void showToast(String msg) {
  try {
    _showToast(msg);
  } catch(e) {
    if (kDebugMode) {
      print(e);
    }
  }
}


_showToast(String msg) {
 try {
   Widget toast = Container(
     constraints: const BoxConstraints(
       maxWidth: 400
     ),
     padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
     decoration: BoxDecoration(
       borderRadius: BorderRadius.circular(5.0),
       color: AppColor.secondary,
     ),
     child:   Text(msg,
       style: const TextStyle(
           fontFamily: AppConstant.fontFamily,
           color: Colors.white
       ),),
   );
   FToast fToast = FToast();
   fToast.init(NavigationService.context!);
   fToast.showToast(
     child: toast,
     gravity: ToastGravity.TOP_RIGHT,
     toastDuration: const Duration(seconds: 3),
   );
 } catch(e){
   rethrow;
 }
}