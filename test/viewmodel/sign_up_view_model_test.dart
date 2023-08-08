import 'dart:io';

import 'package:flutter_boilerplate/view_model/signup_view_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    SharedPreferences.setMockInitialValues({});
  });

  test('SignUpViewModel test', () {
    final model = SignUpViewModel();
    model.firstNameC.text = "Jaimin";
    expect(model.firstNameC.text, "Jaimin");
    model.lastNameC.text = "Modi";
    expect(model.lastNameC.text, "Modi");
    model.emailC.text = "jaimin.modi@growexx.com";
    expect(model.emailC.text, "jaimin.modi@growexx.com");
    model.passwordC.text = "Test@123";
    expect(model.passwordC.text, "Test@123");
    model.confirmPasswordC.text = "Test@123";
    expect(model.confirmPasswordC.text, "Test@123");
    model.setPickedImage = File.fromUri(Uri.parse(""));
  });
}
