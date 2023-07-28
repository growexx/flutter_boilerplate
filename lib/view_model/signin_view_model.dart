import 'package:flutter/cupertino.dart';

class SignInViewModel extends ChangeNotifier {
  var isRememberMeChecked = false;
  final TextEditingController emailC = TextEditingController();
  final TextEditingController passwordC = TextEditingController();

  bool get getRememberMe {
    return isRememberMeChecked;
  }

  Future<bool> signIn({
    required String email,
    required String password,
  }) async {
    /// Implement Api Call Here
    return true;
  }

  set setRememberMe(bool value) {
    isRememberMeChecked = value;
    notifyListeners();
  }
}
