import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/view/screens/signin/signin_screen.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http;

class SignUpViewModel extends ChangeNotifier {
  http.Client client = http.Client();
  File? pickedImage;

  SignUpViewModel() {
    //checkIfUserIsLoggedIn();
  }
  final TextEditingController firstNameC = TextEditingController();
  final TextEditingController lastNameC = TextEditingController();
  final TextEditingController emailC = TextEditingController();
  final TextEditingController passwordC = TextEditingController();
  final TextEditingController confirmPasswordC = TextEditingController();

  set setPickedImage(File? val) {
    pickedImage = val;
    notifyListeners();
  }

  Future<bool> signUp({
    required String firstName,
    required String lastName,
    required String email,
    required String password, required BuildContext context,
  }) async {
    /// Implement Api Call Here & navigate to Login screen
    Router.neglect(context, () => context.goNamed(SignInScreen.name));
    return true;
  }
}
