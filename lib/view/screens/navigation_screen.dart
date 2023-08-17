import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/models/option.dart';
import 'package:flutter_boilerplate/util/show_exit_pop_up.dart';
import 'package:flutter_boilerplate/view/widgets/screen_text_and_theme_controller.dart';
import '../../app_manager/helper/navigation/navigation_helper.dart';
import 'navigation/bottom_tab_navigation.dart';
import 'navigation/drawer_navigation.dart';
import 'navigation/top_tab_navigation.dart';

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({super.key});
  static const String name = "navigation_screen";
  static const String path = "/$name";

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  @override
  Widget build(BuildContext context) {
    List<Option<Color>> paths = [
      Option<Color>(
          title: 'navigation'.tr(gender: "drawer_navigation"),
          value: DrawerNavigation.name,
          extra: Colors.redAccent.withOpacity(0.8)),
      Option<Color>(
          title: 'navigation'.tr(gender: "top_tab_navigation"),
          value: TopTabNavigation.name,
          extra: Colors.yellowAccent.withOpacity(0.8)),
      Option<Color>(
          title: 'navigation'.tr(gender: "bottom_tab_navigation"),
          value: BottomTabNavigation.name,
          extra: Colors.greenAccent.withOpacity(0.8)),
    ];
    return WillPopScope(
      onWillPop: () {
        showExitPopUp(context);
        return Future.value(true);
      },
      child: Scaffold(
          body: Column(
        children: [
          ScreenTextAndThemeController(onChange: () {
            setState(() {});
          }),
          Expanded(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(paths.length, (index) {
                  Option path = paths[index];
                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    width: MediaQuery.of(context).size.width * 0.50,
                    child: TextButton(
                      key: const Key('navigate-text-button'),
                      // shape: RoundedRectangleBorder(
                      //     borderRadius: BorderRadius.circular(18)),
                      // minWidth: 100,
                      // height: 20,
                      onPressed: () {
                        NavigationHelper.pushNamed(context, path.value!);
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                path.title!,
                                // style: theme.textTheme.titleMedium,
                              ),
                            ),
                            const Icon(Icons.arrow_forward_ios_rounded)
                          ],
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ),
          ),
        ],
      )),
    );
  }
}
