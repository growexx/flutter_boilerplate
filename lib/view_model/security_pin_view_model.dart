import 'package:flutter/cupertino.dart';
import 'package:flutter_boilerplate/view/screens/dashboard/dashboard_screen.dart';
import 'package:go_router/go_router.dart';

class SecurityPinViewModel extends ChangeNotifier {
  final TextEditingController pinC = TextEditingController();

  Future<bool> savePin({
    required String pin,
    required BuildContext context,
  }) async {
    /// Save Pin locally & Navigate to dashboard
    Router.neglect(context, () => context.goNamed(DashboardScreen.name));
    return true;
  }
}
