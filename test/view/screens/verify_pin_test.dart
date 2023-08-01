import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/authentication/user_repository.dart';
import 'package:flutter_boilerplate/view/screens/pin_support/widget/verify_pin_field_widget.dart';
import 'package:flutter_boilerplate/view_model/security_pin_view_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import '../../util/common_initial_activity.dart';
import '../../util/testing_material_app.dart';
import 'set_pin_test.mocks.dart';

@GenerateNiceMocks([
  MockSpec<SecurityPinViewModel>(
      as: #MockSecurityPINViewModel, onMissingStub: OnMissingStub.returnDefault),
])
@GenerateNiceMocks([
  MockSpec<UserRepository>(
      as: #MockUserRepository, onMissingStub: OnMissingStub.returnDefault),
])
void main() async {
  await commonInitialActivity();
  TestWidgetsFlutterBinding.ensureInitialized();

  group("Verify PIN test", () {
    testWidgets('Verify PIN widget', (WidgetTester tester) async {
      MockSecurityPINViewModel mockSecurityPINViewModel= MockSecurityPINViewModel();
      MockUserRepository mockUserRepository = MockUserRepository();

      Widget widget = testingWidget(
          child: VerifySecurityPinWidget(
        userRepository: mockUserRepository,
        viewModel: mockSecurityPINViewModel,
        key: const Key("12"),
      ));

      await tester.pumpWidget(widget);

      expect(find.byKey(const Key("verify_security_pin")), findsOneWidget);
      expect(find.byKey(const Key("enter_security_pin")), findsOneWidget);
      expect(find.byKey(const Key("tf_security_pin")), findsOneWidget);
      expect(find.byKey(const Key("tb_verify")), findsOneWidget);

      final Finder verifyButton = find.byKey(const Key("tb_verify"));
      expect(verifyButton, findsOneWidget);

      await tester.tap(verifyButton);
      await tester.pumpAndSettle();
    });
  });
}
