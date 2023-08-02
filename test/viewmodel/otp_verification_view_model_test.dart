import 'package:flutter_boilerplate/view_model/otp_verification_view_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  test('OTPVerificationViewModel test', () {
    final model = OTPVerificationViewModel();
    /*expect(model.forgetPasswordStatus, ButtonStatus.initial);
    model.forgetPasswordStatus = ButtonStatus.hit;
    expect(model.forgetPasswordStatus, ButtonStatus.hit);*/
  });
}
