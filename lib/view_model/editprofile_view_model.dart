import 'package:flutter/cupertino.dart';
import 'package:flutter_boilerplate/view/screens/dashboard/dashboard_screen.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http;

class EditProfileViewModel extends ChangeNotifier {
  http.Client client = http.Client();
  final TextEditingController firstNameC = TextEditingController();
  final TextEditingController lastNameC = TextEditingController();
  final TextEditingController emailC = TextEditingController();

  Future<bool> editProfile({
    required String firstName,
    required String lastName,
    required String email, required BuildContext context,
  }) async {
    /// Implement Api Call Here & navigate to Login screen
    Router.neglect(context, () => context.goNamed(DashboardScreen.name));
    return true;
  }
}
