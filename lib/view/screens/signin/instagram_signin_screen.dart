import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/authentication/user_repository.dart';
import 'package:flutter_boilerplate/view_model/instagram_signin_view_model.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../../app_manager/helper/navigation/navigation_helper.dart';
import '../../../authentication/user.dart';
import '../navigation_screen.dart';

class InstagramSigninScreen extends StatelessWidget {
  static const String name = "instagram-signin-screen";
  static const String path = "/$name";
  const InstagramSigninScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<InstagramSigninViewModel>(
      builder: (context, viewModel, child) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              'Instagram Login',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          ),
          body: WebViewWidget(controller: getController(context, viewModel)),
        );
      },
    );
  }

  WebViewController getController(
      BuildContext context, InstagramSigninViewModel viewModel) {
    final userRepository = UserRepository();
    return WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(Colors.transparent)
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            print('Progressing $progress');
          },
          onPageStarted: (String url) {
            print('page started $url');
          },
          onPageFinished: (String url) {
            print('page finished $url');
          },
          onWebResourceError: (WebResourceError error) {
            print('erorr ${error.description}');
          },
          onNavigationRequest: (request) async {
            if (request.url.startsWith(viewModel.redirectUri)) {
              print(
                  '----------------------------------------------------${request.url}');
              viewModel.getAuthorizationCode(request.url);
              await viewModel.getTokenAndUserID().then((bool isDone) {
                if (isDone) {
                  viewModel.getUserProfile().then((User user) {
                    userRepository.updateUserData(user).then((value) {
                      NavigationHelper.pushNamed(
                          context, NavigationScreen.name);
                    });
                    print('${user.firstName} logged in!');
                  });
                }
              });
              return NavigationDecision.prevent;
            }
            if (request.url.startsWith(
                'https://www.instagram.com/accounts/manage_access/')) {
              context.pop();
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(viewModel.url));
  }
}
