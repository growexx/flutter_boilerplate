import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum Status { verifiedSuccess, verifiedFailure }

class OTPViewModel extends ChangeNotifier {
  var isPhoneNumberEntered = false;
  var isValidNumber = false;
  Status verificationStatus = Status.verifiedFailure;

  OTPViewModel() {
    //process required things..
  }

  final TextEditingController phoneC = TextEditingController();
  final TextEditingController otpC = TextEditingController();

  set setPhoneNumberValidated(bool value) {
    isPhoneNumberEntered = value;
    notifyListeners();
  }

  set setIsValidNumber(bool value) {
    isValidNumber = value;
    notifyListeners();
  }

  void otpVerification(BuildContext context, String otp) {
    verificationStatus = Status.verifiedSuccess;
    notifyListeners();
  }
}
