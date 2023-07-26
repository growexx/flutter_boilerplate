
import 'package:delayed_widget/delayed_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/app_manager/constant/app_constant.dart';
import 'package:flutter_boilerplate/util/check_login_status.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  static const String name = "splash_screen";
  static const String path = "/";

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return FutureBuilder(
      future: checkLoginStatus(context),
      builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
        return Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Center(
              child: ConstrainedBox(
                  constraints: const BoxConstraints(
                      maxWidth: 400
                  ),
                  child:  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // Add your projects logo
                        DelayedWidget(
                          animationDuration: AppConstant.animationDuration,
                          child: const FlutterLogo(
                            size: 100,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: DelayedWidget(
                            animation: DelayedAnimations.SLIDE_FROM_LEFT,
                            animationDuration: AppConstant.animationDuration,
                            delayDuration: AppConstant.animationDuration,
                            child: Text(AppConstant.appName,
                              textAlign: TextAlign.center,
                              style: theme.textTheme.titleLarge,).tr(),
                          ),
                        ),
                      ],
                    ),
                  )),
            ),
          ),
        );
      },
    );
  }
}
