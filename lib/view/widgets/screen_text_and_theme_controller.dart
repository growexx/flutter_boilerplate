import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/app_manager/locale/widget/locale_selector_widget.dart';
import 'package:flutter_boilerplate/app_manager/theme/widget/theme_mode_selector.dart';

class ScreenTextAndThemeController extends StatelessWidget {
  final VoidCallback onChange;
  const ScreenTextAndThemeController({super.key, required this.onChange});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Wrap(
          alignment: WrapAlignment.spaceAround,
          children: [
            const ThemeModeSelector(),
            LocaleSelectorWidget(
              onLocaleChange: () {
                onChange();
              },
            )
          ],
        ),
      ),
    );
  }
}
