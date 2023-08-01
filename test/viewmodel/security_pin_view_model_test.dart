import 'package:flutter_boilerplate/view_model/security_pin_view_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    SharedPreferences.setMockInitialValues({});
  });

  test('SecurityPinViewModel test', () {
    final model = SecurityPinViewModel();
    model.pinC.text = "1234";
    expect(model.pinC.text, "1234");
  });
}
