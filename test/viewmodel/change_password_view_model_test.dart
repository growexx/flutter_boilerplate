import 'package:flutter_boilerplate/view_model/change_password_view_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    SharedPreferences.setMockInitialValues({});
  });

  test('ChangePasswordViewModel test', () {
    final model = ChangePasswordViewModel();
    model.oldPasswordC.text = "Test@123";
    expect(model.oldPasswordC.text, "Test@123");
    model.newPasswordC.text = "Test@1234";
    expect(model.newPasswordC.text, "Test@1234");
    model.confirmNewPasswordC.text = "Test@1234";
    expect(model.confirmNewPasswordC.text, "Test@1234");
  });
}
