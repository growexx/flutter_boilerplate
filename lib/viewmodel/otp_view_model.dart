import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class OTPViewModel extends ChangeNotifier {
  http.Client client = http.Client();

  OTPViewModel() {
    //pending..
  }

  final TextEditingController phoneC = TextEditingController();
  final TextEditingController otpC = TextEditingController();
}
