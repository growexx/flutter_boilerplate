import 'package:flutter_boilerplate/view_model/signin_view_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    SharedPreferences.setMockInitialValues({});
  });

  test('SignInViewModel test', () {
    final model = SignInViewModel();
    model.isRememberMeChecked=false;
    expect(model.isRememberMeChecked, false);
    model.isRememberMeChecked=true;
    expect(model.isRememberMeChecked, true);
    model.emailC.text = "jaimin.modi@growexx.com";
    expect(model.emailC.text, "jaimin.modi@growexx.com");
    model.passwordC.text = "Test@123";
    expect(model.passwordC.text, "Test@123");
    model.setRememberMe=false;
    expect(model.getRememberMe,false);
  });
}
