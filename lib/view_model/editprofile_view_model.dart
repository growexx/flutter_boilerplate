import 'package:flutter/cupertino.dart';
import 'package:flutter_boilerplate/view/screens/dashboard/dashboard_screen.dart';
import 'package:go_router/go_router.dart';


class EditProfileViewModel extends ChangeNotifier {
  EditProfileViewModel() {
    //checkIfUserIsLoggedIn();
  }
  var isValidNumber = false;
  final TextEditingController firstNameC = TextEditingController();
  final TextEditingController lastNameC = TextEditingController();
  final TextEditingController emailC = TextEditingController();
  final TextEditingController phoneC = TextEditingController();

  String? _selectedImagePath;
  String? get selectedImagePath=> _selectedImagePath;
  set selectedImagePath(String? val) {
    _selectedImagePath = val;
    notifyListeners();
  }
  set setIsValidNumber(bool value) {
    isValidNumber = value;
    notifyListeners();
  }

  Future<bool> editProfile({
    required String firstName,
    required String lastName,
    required String email,
    required String phone,
    required BuildContext context,
  }) async {
    /// Implement Api Call Here & navigate to Login screen
    Router.neglect(context, () => context.goNamed(DashboardScreen.name));
    return true;
  }
}
