import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/app_manager/theme/theme_provider.dart';
import 'package:flutter_boilerplate/authentication/user_repository.dart';
import 'package:flutter_boilerplate/view/screens/otp/widget/otp_verification_widget.dart';
import 'package:flutter_boilerplate/view/screens/otp/widget/otp_widget.dart';
import 'package:flutter_boilerplate/view_model/otp_view_model.dart';
import 'package:flutter_boilerplate/view_model/social_signin_view_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';
import '../../util/common_initial_activity.dart';
import 'otp_screen_test.mocks.dart';

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
@GenerateNiceMocks([
  MockSpec<ThemeProvider>(
      as: #MockThemeProvider, onMissingStub: OnMissingStub.returnDefault),
])
void main() async {
  await commonInitialActivity();
  TestWidgetsFlutterBinding.ensureInitialized();

  group("OTP Screen Test", () {
    testWidgets('otp verification screen', (WidgetTester tester) async {
      MockOTPViewModel mockOTPViewModel = MockOTPViewModel();
      MockSocialSignInViewModel mockSocialSignInViewModel =
          MockSocialSignInViewModel();
      MockUserRepository mockUserRepository = MockUserRepository();
      MockThemeProvider mockThemeProvider = MockThemeProvider();
      MockPhoneController mockPhoneController = MockPhoneController();
      TextEditingController phoneEditingController =
          TextEditingController(text: "9408776491");

      when(mockOTPViewModel.phoneC).thenReturn(phoneEditingController);
      await tester.pumpWidget(
        MultiProvider(
          providers: [
            ChangeNotifierProvider<OTPViewModel>.value(value: mockOTPViewModel),
            ChangeNotifierProvider<SocialSignInViewModel>.value(
                value: mockSocialSignInViewModel),
            ChangeNotifierProvider<UserRepository>.value(
                value: mockUserRepository),
            ChangeNotifierProvider<ThemeProvider>.value(
                value: mockThemeProvider),
          ],
          /*child: const MaterialApp(
            home: OTPWidget(
                googleSignInViewModel: mockSocialSignInViewModel,
                userRepository: mockUserRepository,
                viewModel: mockOTPViewModel,
                key: Key("")),
          ),*/
        ),
      );
      //Widget widget = testingMaterial(initialLocation: OTPScreen.path);
      //await tester.pumpWidget(widget);
      expect(find.byKey(const Key("send_otp")), findsOneWidget);
      expect(find.byKey(const Key("add_your_phone_number")), findsOneWidget);
      expect(find.byKey(const Key("phone")), findsOneWidget);

      await tester.pumpAndSettle(const Duration(seconds: 2));

      await tester.enterText(find.byKey(const Key("phone")), '9408776491');
      await tester.testTextInput.receiveAction(TextInputAction.done);

      when(mockOTPViewModel.isPhoneNumberEntered).thenReturn(true);

      //OTP button Tap
      final Finder sendButton = find.byType(TextButton);
      await tester.ensureVisible(find.text('Send'));
      await tester.tap(sendButton);

      await tester.pumpAndSettle(const Duration(seconds: 2));

      expect(find.byType(OTPVerificationWidget), findsOneWidget);
      /*expect(find.byKey(const Key("verification")), findsOneWidget);
      expect(find.byKey(const Key("enter_otp")), findsOneWidget);
      expect(find.byKey(const Key("otp_text_field_container")), findsOneWidget);

      final Finder otpField = find.byKey(const Key("otp_text_field"));
      expect(otpField, findsNWidgets(4));
      await tester.enterText(otpField, '1');
      await tester.testTextInput.receiveAction(TextInputAction.done);

      expect(find.byKey(const Key("verify")), findsOneWidget);
      expect(find.byKey(const Key("did_not_receive_code")), findsOneWidget);

      final Finder reSendButton = find.byKey(const Key("resend_new_code"));
      expect(reSendButton, findsOneWidget);

      //Re-send button Tap
      await tester.tap(reSendButton, warnIfMissed: false);
      await tester.pumpAndSettle(const Duration(seconds: 2));
      await tester.pumpAndSettle();*/
    });
  });
}
