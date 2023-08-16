import 'package:flutter/cupertino.dart';
import 'package:flutter_boilerplate/view_model/otp_view_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';

import 'otp_view_model_test.mocks.dart';

//class MockBuildContext extends Mock implements BuildContext {}
@GenerateNiceMocks([
  MockSpec<BuildContext>(
      as: #MockBuildContext, onMissingStub: OnMissingStub.returnDefault),
])
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  test('OTPViewModel test', () {
    MockBuildContext context = MockBuildContext();
    final model = OTPViewModel();
    model.phoneC.text = "9499999999";
    expect(model.phoneC.text, "9499999999");
    model.otpC.text = "1234";
    expect(model.otpC.text, "1234");
    model.setPhoneNumberValidated = true;
    expect(model.isPhoneNumberEntered, true);
    model.setPhoneNumberValidated = false;
    expect(model.isPhoneNumberEntered, false);
    model.isPhoneNumberEntered = false;
    expect(model.isPhoneNumberEntered, false);
    model.isPhoneNumberEntered = true;
    expect(model.isPhoneNumberEntered, true);

    model.otpVerification(context, "1234");
    expect(model.verificationStatus, Status.verifiedSuccess);
    model.setIsValidNumber = false;
    expect(model.isValidNumber, false);
  });
}
