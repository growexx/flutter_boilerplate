import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/view/screens/signin/instagram_signin_screen.dart';
import 'package:flutter_boilerplate/view_model/instagram_signin_view_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:webview_flutter_platform_interface/src/platform_navigation_delegate.dart';
import 'package:webview_flutter_platform_interface/src/platform_webview_controller.dart';
import 'package:webview_flutter_platform_interface/src/platform_webview_widget.dart';
import 'package:webview_flutter_platform_interface/src/types/load_request_params.dart';

import '../../util/common_initial_activity.dart';

void main() async {
  await commonInitialActivity();
  setUp(() {
    WebViewPlatform.instance = FakeWebViewPlatform();
  });
  testWidgets(
    "Instagram Signin Screen Test",
    (WidgetTester tester) async {
      Widget widget = MaterialApp(
        builder: (context, child) {
          return ChangeNotifierProvider<InstagramSigninViewModel>(
              create: (context) => InstagramSigninViewModel(),
              child: const InstagramSigninScreen());
        },
      );
      await tester.pumpWidget(widget);
      expect(find.text('Instagram Login'), findsOneWidget);
    },
  );
}

class FakeWebViewPlatform extends WebViewPlatform {
  @override
  PlatformWebViewController createPlatformWebViewController(
      PlatformWebViewControllerCreationParams params) {
    return FakeWebViewController(params);
  }

  @override
  PlatformNavigationDelegate createPlatformNavigationDelegate(
      PlatformNavigationDelegateCreationParams params) {
    return FakeNavigationDelegate(params);
  }

  @override
  PlatformWebViewWidget createPlatformWebViewWidget(
      PlatformWebViewWidgetCreationParams params) {
    return FakeWebViewWidget(params);
  }
}

class FakeWebViewController extends PlatformWebViewController {
  FakeWebViewController(super.params) : super.implementation();

  @override
  Future<void> setJavaScriptMode(JavaScriptMode javaScriptMode) async {}

  @override
  Future<void> setBackgroundColor(Color color) async {}

  @override
  Future<void> setPlatformNavigationDelegate(
      PlatformNavigationDelegate handler) async {}

  @override
  Future<void> addJavaScriptChannel(
      JavaScriptChannelParams javaScriptChannelParams) async {}

  @override
  Future<void> loadRequest(LoadRequestParams params) async {}

  @override
  Future<String?> currentUrl() async {
    return 'https://www.google.com';
  }
}

class FakeNavigationDelegate extends PlatformNavigationDelegate {
  FakeNavigationDelegate(super.params) : super.implementation();

  @override
  Future<void> setOnNavigationRequest(
    NavigationRequestCallback onNavigationRequest,
  ) async {}

  @override
  Future<void> setOnPageFinished(PageEventCallback onPageFinished) async {}

  @override
  Future<void> setOnPageStarted(PageEventCallback onPageStarted) async {}

  @override
  Future<void> setOnProgress(ProgressCallback onProgress) async {}

  @override
  Future<void> setOnWebResourceError(
    WebResourceErrorCallback onWebResourceError,
  ) async {}

  @override
  Future<void> setOnUrlChange(UrlChangeCallback onUrlChange) async {}
}

class FakeWebViewWidget extends PlatformWebViewWidget {
  FakeWebViewWidget(super.params) : super.implementation();

  @override
  Widget build(BuildContext context) {
    return const Directionality(
        textDirection: TextDirection.ltr, child: Scaffold());
  }
}
