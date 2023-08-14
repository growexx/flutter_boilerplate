import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import '../app_manager/constant/environment.dart';
import 'package:http/http.dart' as http;

import '../authentication/user.dart';

class InstagramSigninViewModel extends ChangeNotifier {
  final url =
      'https://api.instagram.com/oauth/authorize?client_id=${dotenv.env[Environment.instagramAppID]}&redirect_uri=${dotenv.env[Environment.firebaseRedirectURI]}&scope=user_profile&response_type=code';

  final String redirectUri = dotenv.env[Environment.firebaseRedirectURI]!;
  final String instagramAppId = dotenv.env[Environment.instagramAppID]!;
  final String instagramAppSecretKey =
      dotenv.env[Environment.instagramAppSecretKey]!;

  String? authorizationCode;
  int? userID;
  String? accessToken;

  void getAuthorizationCode(String url) {
    authorizationCode = url.replaceAll('$redirectUri?code=', '');
    print(
        '----------------------------------------------------------------authCode $authorizationCode');
  }

  Future<bool> getTokenAndUserID() async {
    var url = Uri.parse('https://api.instagram.com/oauth/access_token');
    final response = await http.post(url, body: {
      'client_id': instagramAppId,
      'redirect_uri': redirectUri,
      'client_secret': instagramAppSecretKey,
      'code': authorizationCode,
      'grant_type': 'authorization_code'
    });
    print(
        '------------------------------------------response ${response.body}');
    accessToken = json.decode(response.body)['access_token'];
    userID = json.decode(response.body)['user_id'];
    return (accessToken != null && userID != null) ? true : false;
  }

  Future<User> getUserProfile() async {
    final List<String> userFields = ['id', 'username'];
    final fields = userFields.join(',');
    final responseNode = await http.get(Uri.parse(
        'https://graph.instagram.com/$userID?fields=$fields&access_token=$accessToken'));
    print(
        '----------------------------------------------------final response${responseNode.body}');
    final username = json.decode(responseNode.body)['username'];
    final id = json.decode(responseNode.body)['id'];
    final User user = User(id: id, firstName: username, lastName: '');
    return user;
  }
}
