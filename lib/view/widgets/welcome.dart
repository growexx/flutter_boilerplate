import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/gen/assets.gen.dart';

class WelcomeWidget extends StatelessWidget {
  const WelcomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Stack(children: [
      SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Assets.png.bg_wallpaper.image(fit: BoxFit.fill),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 50,right: 50, bottom: 80),
        child: Align(
            alignment: Alignment.bottomCenter,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("welcome",
                    style: theme.textTheme.headlineLarge).tr(),
                const SizedBox(height: 30),
                Text(
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                    "flutter_description1",
                    style: theme.textTheme.headlineSmall).tr(),
                const SizedBox(height: 30),
                Text(
                    maxLines: 10,
                    overflow: TextOverflow.ellipsis,
                    "flutter_description2",
                    style: theme.textTheme.headlineSmall).tr()
              ],
            )),
      )
    ]);
  }
}