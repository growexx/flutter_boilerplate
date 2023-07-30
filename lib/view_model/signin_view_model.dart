import 'package:flutter/cupertino.dart';
import 'package:flutter_boilerplate/view/screens/dashboard/dashboard_screen.dart';
import 'package:go_router/go_router.dart';

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
    required BuildContext context,
  }) async {
    /// Implement Api Call Here & Navigate to dashboard
    Router.neglect(context, () => context.goNamed(DashboardScreen.name));
    return true;
  }

  set setRememberMe(bool value) {
    isRememberMeChecked = value;
    notifyListeners();
  }
}
