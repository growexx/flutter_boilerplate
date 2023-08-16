import 'package:flutter/cupertino.dart';
import 'package:flutter_boilerplate/app_manager/enum/button_status.dart';
import 'package:flutter_boilerplate/view_model/security_pin_view_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';

import 'security_pin_view_model_test.mocks.dart';
@GenerateNiceMocks([
  MockSpec<BuildContext>(
      as: #MockBuildContextSecurityPin, onMissingStub: OnMissingStub.returnDefault),
])
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  test('SecurityPinViewModel test', () {
    final model = SecurityPinViewModel();
    MockBuildContextSecurityPin context = MockBuildContextSecurityPin();
    model.pinC.text = "1234";
    expect(model.pinC.text, "1234");

    model.savePin(pin: "1234", context: context);
    expect(model.buttonStatus, ButtonStatus.complete);
  });
}
