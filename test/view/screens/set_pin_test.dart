import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/authentication/user_repository.dart';
import 'package:flutter_boilerplate/view/screens/pin_support/widget/set_pin_field_widget.dart';
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

  group("Set Security PIN test", () {
    testWidgets('Set Security PIN widget', (WidgetTester tester) async {
      MockSecurityPINViewModel mockSecurityPINViewModel= MockSecurityPINViewModel();
      MockUserRepository mockUserRepository = MockUserRepository();

      Widget widget = testingWidget(
          child: SetSecurityPinWidget(
        userRepository: mockUserRepository,
        viewModel: mockSecurityPINViewModel,
        key: const Key("12"),
      ));

      await tester.pumpWidget(widget);

      expect(find.byKey(const Key("security_pin")), findsOneWidget);
      expect(find.byKey(const Key("security_pin_description")), findsOneWidget);
      expect(find.byKey(const Key("tf_security_pin")), findsOneWidget);
      expect(find.byKey(const Key("tb_save")), findsOneWidget);

      final Finder saveButton = find.byKey(const Key("tb_save"));
      expect(saveButton, findsOneWidget);

      await tester.tap(saveButton);
      await tester.pumpAndSettle();
    });
  });
}
