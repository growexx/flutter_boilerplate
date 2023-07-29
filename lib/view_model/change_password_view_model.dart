import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class ChangePasswordViewModel extends ChangeNotifier {
  http.Client client = http.Client();

  ChangePasswordViewModel() {
    //
  }

  final TextEditingController oldPasswordC = TextEditingController();
  final TextEditingController newPasswordC = TextEditingController();
  final TextEditingController confirmNewPasswordC = TextEditingController();

  Future<bool> changePassword({
    required String oldPassword,
    required String newPassword,
  }) async {
    /// Implement Api Call Here
    return true;
  }
}
