import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/gen/assets.gen.dart';

class WelcomeWidget extends StatelessWidget {
  const WelcomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Stack(
        key:const Key("bg_stack"),
        children: [
      SizedBox(
        key:const Key("sb_wallpaper"),
        width: MediaQuery.of(context).size.width,
        child: Assets.png.bgWallpaper.image(fit: BoxFit.cover),
      ),
      Padding(
        padding: const EdgeInsets.all(50),
        child: Align(
            key:const Key("align"),
            alignment: Alignment.bottomCenter,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                      key:const Key("welcome"),
                      "welcome",
                      style: theme.textTheme.headlineLarge).tr(),
                  const SizedBox(height: 30),
                  Text(
                      key:const Key("description1"),
                      maxLines: 4,
                      overflow: TextOverflow.ellipsis,
                      "flutter_description1",
                      style: theme.textTheme.headlineSmall).tr(),
                  const SizedBox(height: 30),
                  Text(
                      key:const Key("description2"),
                      maxLines: 10,
                      overflow: TextOverflow.ellipsis,
                      "flutter_description2",
                      style: theme.textTheme.headlineSmall).tr()
                ],
              ),
            )),
      )
    ]);
  }
}