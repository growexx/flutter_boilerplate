// Mocks generated by Mockito 5.4.2 from annotations
// in flutter_boilerplate/test/view/screens/otp_widget_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i7;
import 'dart:ui' as _i5;

import 'package:flutter/cupertino.dart' as _i2;
import 'package:flutter_boilerplate/authentication/user.dart' as _i3;
import 'package:flutter_boilerplate/authentication/user_repository.dart' as _i8;
import 'package:flutter_boilerplate/view_model/otp_view_model.dart' as _i4;
import 'package:flutter_boilerplate/view_model/social_signin_view_model.dart'
    as _i6;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeTextEditingController_0 extends _i1.SmartFake
    implements _i2.TextEditingController {
  _FakeTextEditingController_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeUser_1 extends _i1.SmartFake implements _i3.User {
  _FakeUser_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [OTPViewModel].
///
/// See the documentation for Mockito's code generation for more information.
class MockOTPViewModel extends _i1.Mock implements _i4.OTPViewModel {
  @override
  bool get isPhoneNumberEntered => (super.noSuchMethod(
        Invocation.getter(#isPhoneNumberEntered),
        returnValue: false,
        returnValueForMissingStub: false,
      ) as bool);
  @override
  set isPhoneNumberEntered(bool? _isPhoneNumberEntered) => super.noSuchMethod(
        Invocation.setter(
          #isPhoneNumberEntered,
          _isPhoneNumberEntered,
        ),
        returnValueForMissingStub: null,
      );
  @override
  _i4.Status get verificationStatus => (super.noSuchMethod(
        Invocation.getter(#verificationStatus),
        returnValue: _i4.Status.verifiedSuccess,
        returnValueForMissingStub: _i4.Status.verifiedSuccess,
      ) as _i4.Status);
  @override
  set verificationStatus(_i4.Status? _verificationStatus) => super.noSuchMethod(
        Invocation.setter(
          #verificationStatus,
          _verificationStatus,
        ),
        returnValueForMissingStub: null,
      );
  @override
  _i2.TextEditingController get phoneC => (super.noSuchMethod(
        Invocation.getter(#phoneC),
        returnValue: _FakeTextEditingController_0(
          this,
          Invocation.getter(#phoneC),
        ),
        returnValueForMissingStub: _FakeTextEditingController_0(
          this,
          Invocation.getter(#phoneC),
        ),
      ) as _i2.TextEditingController);
  @override
  _i2.TextEditingController get otpC => (super.noSuchMethod(
        Invocation.getter(#otpC),
        returnValue: _FakeTextEditingController_0(
          this,
          Invocation.getter(#otpC),
        ),
        returnValueForMissingStub: _FakeTextEditingController_0(
          this,
          Invocation.getter(#otpC),
        ),
      ) as _i2.TextEditingController);
  @override
  set setPhoneNumberValidated(bool? value) => super.noSuchMethod(
        Invocation.setter(
          #setPhoneNumberValidated,
          value,
        ),
        returnValueForMissingStub: null,
      );
  @override
  bool get hasListeners => (super.noSuchMethod(
        Invocation.getter(#hasListeners),
        returnValue: false,
        returnValueForMissingStub: false,
      ) as bool);
  @override
  void otpVerification(
    _i2.BuildContext? context,
    String? otp,
  ) =>
      super.noSuchMethod(
        Invocation.method(
          #otpVerification,
          [
            context,
            otp,
          ],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void addListener(_i5.VoidCallback? listener) => super.noSuchMethod(
        Invocation.method(
          #addListener,
          [listener],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void removeListener(_i5.VoidCallback? listener) => super.noSuchMethod(
        Invocation.method(
          #removeListener,
          [listener],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void dispose() => super.noSuchMethod(
        Invocation.method(
          #dispose,
          [],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void notifyListeners() => super.noSuchMethod(
        Invocation.method(
          #notifyListeners,
          [],
        ),
        returnValueForMissingStub: null,
      );
}

/// A class which mocks [SocialSignInViewModel].
///
/// See the documentation for Mockito's code generation for more information.
class MockSocialSignInViewModel extends _i1.Mock
    implements _i6.SocialSignInViewModel {
  @override
  bool get hasListeners => (super.noSuchMethod(
        Invocation.getter(#hasListeners),
        returnValue: false,
        returnValueForMissingStub: false,
      ) as bool);
  @override
  _i7.Future<_i3.User?> signinWithGoogle() => (super.noSuchMethod(
        Invocation.method(
          #signinWithGoogle,
          [],
        ),
        returnValue: _i7.Future<_i3.User?>.value(),
        returnValueForMissingStub: _i7.Future<_i3.User?>.value(),
      ) as _i7.Future<_i3.User?>);
  @override
  _i7.Future<_i3.User?> signinWithApple() => (super.noSuchMethod(
        Invocation.method(
          #signinWithApple,
          [],
        ),
        returnValue: _i7.Future<_i3.User?>.value(),
        returnValueForMissingStub: _i7.Future<_i3.User?>.value(),
      ) as _i7.Future<_i3.User?>);
  @override
  _i7.Future<_i3.User?> signinWithFaceBook() => (super.noSuchMethod(
        Invocation.method(
          #signinWithFaceBook,
          [],
        ),
        returnValue: _i7.Future<_i3.User?>.value(),
        returnValueForMissingStub: _i7.Future<_i3.User?>.value(),
      ) as _i7.Future<_i3.User?>);
  @override
  _i7.Future<_i3.User?> signinWithTwitter() => (super.noSuchMethod(
        Invocation.method(
          #signinWithTwitter,
          [],
        ),
        returnValue: _i7.Future<_i3.User?>.value(),
        returnValueForMissingStub: _i7.Future<_i3.User?>.value(),
      ) as _i7.Future<_i3.User?>);
  @override
  void addListener(_i5.VoidCallback? listener) => super.noSuchMethod(
        Invocation.method(
          #addListener,
          [listener],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void removeListener(_i5.VoidCallback? listener) => super.noSuchMethod(
        Invocation.method(
          #removeListener,
          [listener],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void dispose() => super.noSuchMethod(
        Invocation.method(
          #dispose,
          [],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void notifyListeners() => super.noSuchMethod(
        Invocation.method(
          #notifyListeners,
          [],
        ),
        returnValueForMissingStub: null,
      );
}

/// A class which mocks [UserRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockUserRepository extends _i1.Mock implements _i8.UserRepository {
  @override
  set currentUser(_i3.User? _currentUser) => super.noSuchMethod(
        Invocation.setter(
          #currentUser,
          _currentUser,
        ),
        returnValueForMissingStub: null,
      );
  @override
  _i3.User get getUser => (super.noSuchMethod(
        Invocation.getter(#getUser),
        returnValue: _FakeUser_1(
          this,
          Invocation.getter(#getUser),
        ),
        returnValueForMissingStub: _FakeUser_1(
          this,
          Invocation.getter(#getUser),
        ),
      ) as _i3.User);
  @override
  bool get isLoggedIn => (super.noSuchMethod(
        Invocation.getter(#isLoggedIn),
        returnValue: false,
        returnValueForMissingStub: false,
      ) as bool);
  @override
  bool get hasListeners => (super.noSuchMethod(
        Invocation.getter(#hasListeners),
        returnValue: false,
        returnValueForMissingStub: false,
      ) as bool);
  @override
  _i7.Future<dynamic> updateUserData(_i3.User? userData) => (super.noSuchMethod(
        Invocation.method(
          #updateUserData,
          [userData],
        ),
        returnValue: _i7.Future<dynamic>.value(),
        returnValueForMissingStub: _i7.Future<dynamic>.value(),
      ) as _i7.Future<dynamic>);
  @override
  void changePassword(_i2.BuildContext? context) => super.noSuchMethod(
        Invocation.method(
          #changePassword,
          [context],
        ),
        returnValueForMissingStub: null,
      );
  @override
  _i7.Future<dynamic> signOutUser(_i2.BuildContext? context) =>
      (super.noSuchMethod(
        Invocation.method(
          #signOutUser,
          [context],
        ),
        returnValue: _i7.Future<dynamic>.value(),
        returnValueForMissingStub: _i7.Future<dynamic>.value(),
      ) as _i7.Future<dynamic>);
  @override
  _i7.Future<dynamic> directLogOut(_i2.BuildContext? context) =>
      (super.noSuchMethod(
        Invocation.method(
          #directLogOut,
          [context],
        ),
        returnValue: _i7.Future<dynamic>.value(),
        returnValueForMissingStub: _i7.Future<dynamic>.value(),
      ) as _i7.Future<dynamic>);
  @override
  _i7.Future<bool?> refreshToken() => (super.noSuchMethod(
        Invocation.method(
          #refreshToken,
          [],
        ),
        returnValue: _i7.Future<bool?>.value(),
        returnValueForMissingStub: _i7.Future<bool?>.value(),
      ) as _i7.Future<bool?>);
  @override
  _i7.Future<dynamic> updateToken(String? token) => (super.noSuchMethod(
        Invocation.method(
          #updateToken,
          [token],
        ),
        returnValue: _i7.Future<dynamic>.value(),
        returnValueForMissingStub: _i7.Future<dynamic>.value(),
      ) as _i7.Future<dynamic>);
  @override
  void addListener(_i5.VoidCallback? listener) => super.noSuchMethod(
        Invocation.method(
          #addListener,
          [listener],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void removeListener(_i5.VoidCallback? listener) => super.noSuchMethod(
        Invocation.method(
          #removeListener,
          [listener],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void dispose() => super.noSuchMethod(
        Invocation.method(
          #dispose,
          [],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void notifyListeners() => super.noSuchMethod(
        Invocation.method(
          #notifyListeners,
          [],
        ),
        returnValueForMissingStub: null,
      );
}
