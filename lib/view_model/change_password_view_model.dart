import 'package:flutter/cupertino.dart';
import 'package:flutter_boilerplate/view/screens/dashboard/dashboard_screen.dart';
import 'package:go_router/go_router.dart';
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
    Router.neglect(context, () => context.goNamed(DashboardScreen.name));
    return true;
  }
}