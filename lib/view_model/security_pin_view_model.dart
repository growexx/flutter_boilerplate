import 'package:flutter/cupertino.dart';
import 'package:flutter_boilerplate/app_manager/enum/button_status.dart';
class SecurityPinViewModel extends ChangeNotifier {
  final TextEditingController pinC = TextEditingController();
  ButtonStatus buttonStatus = ButtonStatus.initial;

  Future<bool> savePin({
    required String pin,
    required BuildContext context,
  }) async {
    buttonStatus  = ButtonStatus.complete;
    notifyListeners();
    return true;
  }
}
