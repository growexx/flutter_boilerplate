

import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/app_manager/constant/storage_constant.dart';
import 'package:flutter_boilerplate/app_manager/theme/theme_provider.dart';
import 'package:flutter_boilerplate/app_manager/theme/widget/theme_mode_selector.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../util/testing_material_app.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late ThemeProvider themeProvider;
  setUp(() {
    themeProvider = ThemeProvider();
  });
  setUpAll(()  {
    SharedPreferences.setMockInitialValues({
      StorageConstant.themeMode: "system"
    }); //set values here
  });


  group("Theme Provider Test", () {
    test('Theme Mode Change Test', () async{
      expect(themeProvider.themeMode, ThemeMode.system);

      // Changing to light mode
      themeProvider.setThemeMode = ThemeMode.light;
      expect(themeProvider.themeMode, ThemeMode.light);

      // Changing to dark mode
      themeProvider.setThemeMode = ThemeMode.dark;
      expect(themeProvider.themeMode, ThemeMode.dark);

      // Changing to system mode
      themeProvider.setThemeMode = ThemeMode.system;
      expect(themeProvider.themeMode, ThemeMode.system);

      // Retrieve theme
      expect(await ThemeProvider.retrieveStoredTheme(), ThemeMode.system);


      expect(ThemeProvider.lightTheme, isNotNull);
      expect(ThemeProvider.darkTheme, isNotNull);

    });


    testWidgets('Theme Mode Selector Widget Testing ', (WidgetTester tester) async {
      Widget widget =  testingWidget(
          child: const Center(child: ThemeModeSelector())
      );
      await tester.pumpWidget(widget);
      await tester.pumpAndSettle();

      await tester.tap(find.byKey(const Key("system")));
      await tester.pumpAndSettle();

      await tester.tap(find.byKey(const Key("light")));
      await tester.pumpAndSettle();

      await tester.tap(find.byKey(const Key("dark")));
      await tester.pumpAndSettle();
    });

  });

}
