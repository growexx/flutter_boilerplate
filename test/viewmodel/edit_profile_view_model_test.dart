import 'package:flutter_boilerplate/view_model/editprofile_view_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    SharedPreferences.setMockInitialValues({});
  });

  test('EditProfileViewModel test', () {
    final model = EditProfileViewModel();
    model.firstNameC.text = "Jaimin";
    expect(model.firstNameC.text, "Jaimin");
    model.lastNameC.text = "Modi";
    expect(model.lastNameC.text, "Modi");
    model.emailC.text = "jaimin.modi@growexx.com";
    expect(model.emailC.text, "jaimin.modi@growexx.com");
    model.selectedImagePath = "";
  });
}
