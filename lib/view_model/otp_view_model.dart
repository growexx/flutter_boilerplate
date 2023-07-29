import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class OTPViewModel extends ChangeNotifier {
  http.Client client = http.Client();
  var isPhoneNumberEntered = false;
  OTPViewModel() {
    //pending..
  }

  final TextEditingController phoneC = TextEditingController();
  final TextEditingController otpC = TextEditingController();
  
  set setPhoneNumberEntered(bool value) {
    isPhoneNumberEntered = value;
    notifyListeners();
  }
}
