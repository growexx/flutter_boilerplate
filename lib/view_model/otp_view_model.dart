import 'package:flutter/cupertino.dart';
import 'package:flutter_boilerplate/view/screens/dashboard/dashboard_screen.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http;

class OTPViewModel extends ChangeNotifier {
  var isPhoneNumberEntered = false;

  OTPViewModel() {
    //pending..
  }

  final TextEditingController phoneC = TextEditingController();
  final TextEditingController otpC = TextEditingController();
  
  set setPhoneNumberValidated(bool value) {
    isPhoneNumberEntered = value;
    notifyListeners();
  }

  void otpVerification(BuildContext context, String otp) {
    /// Implement Api Call Here & navigate to Dashboard screen
    Router.neglect(context, () => context.goNamed(DashboardScreen.name));
  }
}
