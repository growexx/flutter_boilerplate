

import 'package:flutter/cupertino.dart';

class SigninViewModel extends ChangeNotifier{

  final TextEditingController emailC = TextEditingController();
  final TextEditingController passwordC = TextEditingController();


  Future<bool> signIn({
    required String email,
    required String password,
}) async {
    /// Implement Api Call Here
    return true;
  }


}