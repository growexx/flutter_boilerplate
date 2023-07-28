import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class OTPVerificationViewModel extends ChangeNotifier {
  http.Client client = http.Client();

  OTPVerificationViewModel() {
    //code for initialization..
  }
}
