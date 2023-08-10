import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/view/screens/signin/signin_screen.dart';
import 'package:go_router/go_router.dart';

class SignUpViewModel extends ChangeNotifier {


  final TextEditingController firstNameC = TextEditingController();
  final TextEditingController lastNameC = TextEditingController();
  final TextEditingController emailC = TextEditingController();
  final TextEditingController passwordC = TextEditingController();
  final TextEditingController confirmPasswordC = TextEditingController();


  String? _selectedImagePath;
  String? get selectedImagePath=> _selectedImagePath;
  set selectedImagePath(String? val) {
    _selectedImagePath = val;
    notifyListeners();
  }

  Future<bool> signUp({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    /// Implement Api Call Here & navigate to Login screen
    Router.neglect(context, () => context.goNamed(SignInScreen.name));
    return true;
  }
}
