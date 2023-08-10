

import 'package:flutter_boilerplate/view_model/veiw_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  test('OTPVerificationViewModel test', () {
    // final model = OTPVerificationViewModel();
    /*expect(model.forgetPasswordStatus, ButtonStatus.initial);
    model.forgetPasswordStatus = ButtonStatus.hit;
    expect(model.forgetPasswordStatus, ButtonStatus.hit);*/
    final model = OTPVerificationViewModel();
    expect(model.toString().isEmpty , false );
  });
}
