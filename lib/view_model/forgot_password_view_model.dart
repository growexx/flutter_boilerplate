import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class ForgotPasswordViewModel extends ChangeNotifier {
  http.Client client = http.Client();

  ForgotPasswordViewModel() {
    //necessary code can be added here
  }

  final TextEditingController emailAddressC = TextEditingController();

  Future<bool> forgotPassword({required String email}) async {
    /// Implement Api Call Here
    return true;
  }
}
