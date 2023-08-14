import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/view_model/instagram_signin_view_model.dart';
import 'package:provider/provider.dart';
import "package:universal_html/html.dart" as html;

class InstagramWebSigninScreen extends StatefulWidget {
  static const String name = "instagram-web-signin-screen";
  static const String path = "/$name";
  const InstagramWebSigninScreen({super.key});

  @override
  State<InstagramWebSigninScreen> createState() =>
      _InstagramWebSigninScreenState();
}

class _InstagramWebSigninScreenState extends State<InstagramWebSigninScreen> {
  @override
  void initState() {
    html.window.onMessage.forEach((element) {
      print('--------------------------------${element.path}');
    });
    super.initState();
  }

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
            body: Container()
            // WebViewWidget(controller: getController(context, viewModel)),
            );
      },
    );
  }
}
