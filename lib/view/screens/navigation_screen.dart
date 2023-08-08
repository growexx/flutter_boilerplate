
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


    List<Option<Color>> paths =[
      Option<Color>(
        title: 'navigation'.tr(gender: "drawer_navigation"),
        value: DrawerNavigation.name,
        extra: Colors.redAccent.withOpacity(0.8)
      ),
      Option<Color>(
        title: 'navigation'.tr(gender: "top_tab_navigation"),
        value: TopTabNavigation.name,
          extra: Colors.yellowAccent.withOpacity(0.8)
      ),
      Option<Color>(
        title: 'navigation'.tr(gender: "bottom_tab_navigation"),
        value: BottomTabNavigation.name,
          extra: Colors.greenAccent.withOpacity(0.8)
      ),
    ];
    final theme = Theme.of(context);
    return WillPopScope(
      onWillPop: () {
        showExitPopUp(context);
        return Future.value(true);
      },
      child: Scaffold(
          body: Column(
            children: [
              ScreenTextAndThemeController(onChange: (){
                setState(() {

                });
              }),
              Expanded(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(paths.length, (index) {
                      Option path = paths[index];
                      return Expanded(
                        child: MaterialButton(
                          color: path.extra,
                          onPressed: () {
                            NavigationHelper.pushNamed(context, path.value!);
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Text(path.title!,
                                  style: theme.textTheme.titleMedium,),
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
