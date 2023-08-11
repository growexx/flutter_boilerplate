import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/view_model/instagram_signin_view_model.dart';
import 'package:provider/provider.dart';
import 'package:webview_flutter/webview_flutter.dart';

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
          body: WebViewWidget(controller: viewModel.getController()),
        );
      },
    );
  }
}
