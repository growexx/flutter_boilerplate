import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class SignUpViewModel extends ChangeNotifier {
  http.Client client = http.Client();

  SignUpViewModel() {
    //checkIfUserIsLoggedIn();
  }
  final TextEditingController firstNameC = TextEditingController();
  final TextEditingController lastNameC = TextEditingController();
  final TextEditingController emailC = TextEditingController();
  final TextEditingController passwordC = TextEditingController();
  final TextEditingController confirmPasswordC = TextEditingController();
}
