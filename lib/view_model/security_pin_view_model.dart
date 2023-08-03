import 'package:flutter/cupertino.dart';
enum ButtonStatus{notClicked,clicked}
class SecurityPinViewModel extends ChangeNotifier {
  final TextEditingController pinC = TextEditingController();
  ButtonStatus buttonStatus = ButtonStatus.notClicked;

  Future<bool> savePin({
    required String pin,
    required BuildContext context,
  }) async {
    buttonStatus  = ButtonStatus.clicked;
    notifyListeners();
    return true;
  }
}
