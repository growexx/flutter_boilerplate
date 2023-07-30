import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/gen/assets.gen.dart';
import 'package:flutter_boilerplate/view/screens/splash/splash_screen.dart';

class LoginWebPageFillerWidget extends StatelessWidget {
  const LoginWebPageFillerWidget({super.key});

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
                Text("Welcome to Flutter Boilerplate",
                    style: theme.textTheme.headlineLarge),
                const SizedBox(height: 30),
                Text(
                    "Flutter is Google's portable UI toolkit for crafting beautiful, "
                    "natively compiled applications for mobile, web, and desktop from a single codebase. Flutter works with existing code, is used by developers and organizations around the world, and is free and open source.",
                    style: theme.textTheme.headlineSmall),
                const SizedBox(height: 30),
                Text(
                    "For users, Flutter makes beautiful apps come to life. For developers, Flutter lowers the bar to entry for building apps. It speeds app development and reduces the cost and complexity of app production across platforms. For designers, Flutter provides a canvas for high-end user experiences. Fast Company described Flutter as one of the top design ideas of the decade for its ability to turn concepts into production code without the compromises imposed by typical frameworks. It also acts as a productive prototyping tool, with CodePen support for sharing your ideas with others. For engineering managers and businesses, Flutter allows the unification of app developers into a single mobile, web, and desktop app team, building branded apps for multiple platforms out of a single codebase. Flutter speeds feature development and synchronizes release schedules across the entire customer base.",
                    style: theme.textTheme.headlineSmall)
              ],
            )),
      )
    ]);
  }
}
