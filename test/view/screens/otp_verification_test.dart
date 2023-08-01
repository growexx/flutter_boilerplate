import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/authentication/user_repository.dart';
import 'package:flutter_boilerplate/view/screens/otp/widget/otp_verification_widget.dart';
import 'package:flutter_boilerplate/view_model/otp_view_model.dart';
import 'package:flutter_boilerplate/view_model/social_signin_view_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import '../../util/common_initial_activity.dart';
import '../../util/testing_material_app.dart';
import 'otp_widget_test.mocks.dart';

@GenerateNiceMocks([
  MockSpec<OTPViewModel>(
      as: #MockOTPViewModel, onMissingStub: OnMissingStub.returnDefault),
])
@GenerateNiceMocks([
  MockSpec<SocialSignInViewModel>(
      as: #MockSocialSignInViewModel,
      onMissingStub: OnMissingStub.returnDefault),
])
@GenerateNiceMocks([
  MockSpec<UserRepository>(
      as: #MockUserRepository, onMissingStub: OnMissingStub.returnDefault),
])
void main() async {
  await commonInitialActivity();
  TestWidgetsFlutterBinding.ensureInitialized();

  group("OTP Verification Widget test", () {
    testWidgets('OTP Verification widget', (WidgetTester tester) async {
      MockOTPViewModel mockOTPViewModel = MockOTPViewModel();
      MockSocialSignInViewModel mockSocialSignInViewModel =
          MockSocialSignInViewModel();
      MockUserRepository mockUserRepository = MockUserRepository();

      Widget widget = testingWidget(
          child: OTPVerificationWidget(
        googleSignInViewModel: mockSocialSignInViewModel,
        userRepository: mockUserRepository,
        viewModel: mockOTPViewModel,
        key: const Key("12"),
      ));

      await tester.pumpWidget(widget);

      expect(find.byKey(const Key("verification")), findsOneWidget);
      expect(find.byKey(const Key("enter_otp")), findsOneWidget);
      expect(find.byKey(const Key("otp_text_field_container")), findsOneWidget);

      final Finder verifyButton = find.byKey(const Key("verify"));
      expect(verifyButton, findsOneWidget);

      await tester.tap(verifyButton);
      await tester.pumpAndSettle();
    });
  });
}
