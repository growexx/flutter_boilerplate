import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../app_manager/constant/environment.dart';
import 'package:http/http.dart' as http;

class InstagramSigninViewModel extends ChangeNotifier {
  final url =
      'https://api.instagram.com/oauth/authorize?client_id=${dotenv.env[Environment.appId]}&redirect_uri=${dotenv.env[Environment.firebaseRedirectURI]}&scope=user_profile,user_media&response_type=code';

  final String redirectUri = dotenv.env[Environment.firebaseRedirectURI]!;
  final String instagramAppId = dotenv.env[Environment.instagramAppID]!;
  final String instagramAppSecretKey =
      dotenv.env[Environment.instagramAppSecretKey]!;

  String? authorizationCode;
  String? userID;
  String? accessToken;

  WebViewController getController() {
    return WebViewController()
      ..setBackgroundColor(Colors.transparent)
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            print('Progressing');
          },
          onPageStarted: (String url) {
            print('page started $url');
          },
          onPageFinished: (String url) {
            print('page finished $url');
          },
          onWebResourceError: (WebResourceError error) {
            print('erorr $error');
          },
          onUrlChange: (change) async {
            if (change.url!.contains(redirectUri)) {
              getAuthorizationCode(change.url!);
              await getTokenAndUserID().then((bool isDone) {
                if (isDone) {
                  getUserProfile().then((String? username) {
                    print('$username logged in!');
                  });
                }
              });
            }
          },
          onNavigationRequest: (request) {
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(url));
  }

  void getAuthorizationCode(String url) {
    authorizationCode = url.replaceAll('$url&code=', '').replaceAll('#_', '');
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
    accessToken = json.decode(response.body)['access_token'];
    userID = json.decode(response.body)['user_id'];
    return (accessToken != null && userID != null) ? true : false;
  }

  Future<String?> getUserProfile() async {
    final List<String> userFields = ['id', 'username'];
    final fields = userFields.join(',');
    final responseNode = await http.get(Uri.parse(
        'https://graph.instagram.com/$userID?fields=$fields&access_token=$accessToken'));
    final username = json.decode(responseNode.body)['username'];
    return username;
  }
}
