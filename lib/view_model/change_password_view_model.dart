import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_boilerplate/app_manager/helper/show_toast.dart';
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
    required BuildContext context,
  }) async {
    /// Implement Api Call Here & navigate to dashboard
    showToast("password_changed".tr());
    oldPasswordC.text="";
    newPasswordC.text="";
    confirmNewPasswordC.text="";
    return true;
  }
}
