import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class LoginViewModel extends ChangeNotifier {
  http.Client client = http.Client();

  LoginViewModel() {
    //checkIfUserIsLoggedIn();
  }

  final TextEditingController emailC = TextEditingController();
  final TextEditingController passwordC = TextEditingController();
}
