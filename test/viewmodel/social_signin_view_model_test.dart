import 'package:flutter_boilerplate/app_manager/service/social_auth_services/apple_auth.dart';
import 'package:flutter_boilerplate/app_manager/service/social_auth_services/google_auth.dart';
import 'package:flutter_boilerplate/view_model/social_signin_view_model.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mockito/mockito.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

class MockGoogleAuthCatchBlock extends Mock implements GoogleAuth {
  @override
  Future<GoogleSignInAccount?> signIn() {
    throw Exception("Something went wrong");
  }
}

class MockGoogleAuth extends Mock implements GoogleAuth {
  MockGoogleSignInAccount? _currentUser;

  bool _isCancelled = false;

  void setIsCancelled(bool val) {
    _isCancelled = val;
  }

  @override
  Future<GoogleSignInAccount?> signIn() {
    _currentUser = MockGoogleSignInAccount();
    return Future.value(_isCancelled ? null : _currentUser);
  }
}

// ignore: must_be_immutable
class MockGoogleSignInAccount extends Mock implements GoogleSignInAccount {
  @override
  String? get displayName => "John Doe";

  @override
  String get id => '123';

  @override
  String? get photoUrl => 'http://testimage.com';
}

class MockAppleAuth extends Mock implements AppleAuth {
  AuthorizationCredentialAppleID? _currentUser;

  @override
  Future<AuthorizationCredentialAppleID> getAppleIDCredential() {
    _currentUser = MockAuthorizationCredentialAppleID();
    return Future.value(_currentUser);
  }
}

class MockAppleAuthCatchBlock extends Mock implements AppleAuth {
  @override
  Future<AuthorizationCredentialAppleID> getAppleIDCredential() {
    throw Exception("Something went wrong");
  }
}

// ignore: must_be_immutable
class MockAuthorizationCredentialAppleID extends Mock
    implements AuthorizationCredentialAppleID {
  @override
  String? get email => "test@example.com";

  @override
  String? get givenName => 'John Doe';

  @override
  String? get userIdentifier => '123';
}

void main() {
  group('Google Signin', () {
    test(
      "test google signin",
      () async {
        final mockGoogleAuth = MockGoogleAuth();
        final model = SocialSignInViewModel();
        model.googleAuth = mockGoogleAuth;
        final user = await model.signinWithGoogle();
        expect(user?.id, '123');
      },
    );
    test(
      "test google signin cancelled by user",
      () async {
        final mockGoogleAuth = MockGoogleAuth();
        mockGoogleAuth._isCancelled = true;
        final model = SocialSignInViewModel();
        model.googleAuth = mockGoogleAuth;
        final user = await model.signinWithGoogle();
        expect(user, null);
      },
    );

    test(
      "test google signin catch block",
      () async {
        try {
          final mockGoogleAuth = MockGoogleAuthCatchBlock();
          final model = SocialSignInViewModel();
          model.googleAuth = mockGoogleAuth;
          await model.signinWithGoogle();
        } catch (e) {
          expect(e.toString(), 'Exception: Something went wrong');
        }
      },
    );
  });

  group("Apple Auth", () {
    test("test apple signin", () async {
      final mockAppleAuth = MockAppleAuth();
      final model = SocialSignInViewModel();
      model.appleAuth = mockAppleAuth;
      final user = await model.signinWithApple();
      expect(user?.id, '123');
    });

    test("test apple signin catch block", () async {
      try {
        final mockAppleAuth = MockAppleAuthCatchBlock();
        final model = SocialSignInViewModel();
        model.appleAuth = mockAppleAuth;
        await model.signinWithApple();
      } catch (e) {
        expect(e.toString(), 'Exception: Something went wrong');
      }
    });

    test(
      "Apple Authentication",
      () async {
        await dotenv.load();
        final appleAuth = AppleAuth();
        final getUser = appleAuth.getAppleIDCredential();
        expect(getUser.toString().isNotEmpty, true);
      },
    );
  });
}
