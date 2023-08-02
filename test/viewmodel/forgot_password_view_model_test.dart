import 'package:flutter_boilerplate/view_model/forgot_password_view_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    SharedPreferences.setMockInitialValues({});
  });

  test('ForgotPasswordViewModel test', () {
    final model = ForgotPasswordViewModel();
    model.emailAddressC.text = "test@example.com";
    expect(model.emailAddressC.text, "test@example.com");
  });
}
