import 'package:flutter_boilerplate/app_manager/service/social_auth_services/google_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class MockGoogleAuth implements GoogleAuth {
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

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

class MockGoogleSignInAccount implements GoogleSignInAccount {
  @override
  Future<GoogleSignInAuthentication> get authentication =>
      Future.value(MockGoogleSignInAuthentication());

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

class MockGoogleSignInAuthentication implements GoogleSignInAuthentication {
  @override
  String get idToken => 'idToken';

  @override
  String get accessToken => 'accessToken';

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

void main() {}
