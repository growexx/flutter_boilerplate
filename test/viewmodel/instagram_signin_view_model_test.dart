import 'dart:convert';

import 'package:flutter_boilerplate/view_model/instagram_signin_view_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../util/common_initial_activity.dart';
import 'package:http/http.dart' as http;

class MockClient extends Mock implements http.Client {
  @override
  Future<http.Response> post(Uri url,
      {Map<String, String>? headers, Object? body, Encoding? encoding}) async {
    return http.Response(
        json.encode({
          'user_id': 123,
          'access_token': 'abc',
        }),
        200);
  }

  @override
  Future<http.Response> get(Uri url, {Map<String, String>? headers}) async {
    return http.Response(
        json.encode({
          'id': '123',
          'email': null,
          'first_name': 'test',
          'last_name': '',
          'profile_url': null,
          'token': null,
          'refreshToken': null
        }),
        200);
  }
}

void main() async {
  await commonInitialActivity();

  test(
    "get authorization code method test",
    () {
      final InstagramSigninViewModel viewModel = InstagramSigninViewModel();
      viewModel.getAuthorizationCode(
          'https://flutter-boilerplate-919f8.firebaseapp.com/__/auth/handler?code=123');
      expect(viewModel.authorizationCode, '123');
    },
  );

  test(
    "getTokenAndUserID method test",
    () async {
      final InstagramSigninViewModel viewModel = InstagramSigninViewModel();
      viewModel.authorizationCode = '123';
      viewModel.client = MockClient();
      final bool = await viewModel.getTokenAndUserID();
      expect(bool, true);
    },
  );

  test(
    "getUserProfile method test",
    () async {
      final InstagramSigninViewModel viewModel = InstagramSigninViewModel();
      viewModel.userID = 123;
      viewModel.accessToken = '123';
      viewModel.client = MockClient();
      final user = await viewModel.getUserProfile();
      expect(user.id, '123');
    },
  );
}
