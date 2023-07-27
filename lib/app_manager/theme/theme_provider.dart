import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/app_manager/constant/app_constant.dart';
import 'package:flutter_boilerplate/app_manager/constant/storage_constant.dart';
import 'package:flutter_boilerplate/app_manager/helper/local_storage.dart';
import 'package:flutter_boilerplate/app_manager/theme/app_color.dart';
import 'package:flutter_boilerplate/app_manager/theme/theme_components/button_theme.dart';
import 'package:flutter_boilerplate/app_manager/theme/theme_components/checkbox_theme.dart';
import 'package:flutter_boilerplate/app_manager/theme/theme_components/text_field_theme.dart';
import 'package:flutter_boilerplate/app_manager/theme/theme_components/text_theme.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode themeMode;

  ThemeProvider({
    this.themeMode = ThemeMode.system,
  });

  set setThemeMode(ThemeMode val) {
    themeMode = val;
    _storeTheme(val);
    notifyListeners();
  }

  void _storeTheme(ThemeMode value) async {
    await LocalStorage.setString(
        key: StorageConstant.themeMode, data: value.name);
  }

  static Future<ThemeMode> retrieveStoredTheme() async {
    String? storedTheme =
        await LocalStorage.getString(key: StorageConstant.themeMode);
    if (storedTheme != null) {
      return ThemeMode.values.byName(storedTheme);
    } else {
      return ThemeMode.system;
    }
  }

  static ThemeData lightTheme = ThemeData(
      fontFamily: _fontFamily,
      scaffoldBackgroundColor: _scaffoldBackgroundColor,
      appBarTheme: _appBarTheme,
      primaryColor: _primaryColor,
      textTheme: _textThemeLight,
      colorScheme: ColorScheme.light(
          primary: AppColor.primary,
          secondary: AppColor.secondary,
          error: AppColor.error),
      textButtonTheme: _textButtonThemeLight,
      inputDecorationTheme: _inputDecorationThemeLight,
      listTileTheme: _listTileThemeData,
      expansionTileTheme: _expansionTileThemeData,
      tabBarTheme: _tabBarTheme,
      dividerTheme: _dividerThemeData,
      scrollbarTheme: _scrollbarTheme,
      brightness: Brightness.light,
      checkboxTheme: _checkBoxThemeLight);

  static ThemeData darkTheme = ThemeData(
      fontFamily: _fontFamily,
      appBarTheme: _appBarTheme,
      primaryColor: _primaryColor,
      textTheme: _textThemeDark,
      colorScheme: ColorScheme.dark(
        primary: AppColor.primary,
        secondary: AppColor.secondary,
        error: AppColor.error,
      ),
      textButtonTheme: _textButtonThemeDark,
      inputDecorationTheme: _inputDecorationThemeDark,
      listTileTheme: _listTileThemeData,
      expansionTileTheme: _expansionTileThemeData,
      tabBarTheme: _tabBarTheme,
      dividerTheme: _dividerThemeData,
      scrollbarTheme: _scrollbarTheme,
      brightness: Brightness.dark,
      checkboxTheme: _checkBoxThemeDark);

  static const String _fontFamily = AppConstant.fontFamily;
  static final Color _scaffoldBackgroundColor =
      AppColor.scaffoldBackgroundColor;
  static final Color _primaryColor = AppColor.primary;

  static final AppBarTheme _appBarTheme = AppBarTheme(
      color: Colors.transparent,
      centerTitle: true,
      elevation: 0,
      titleTextStyle: TextStyle(
          fontFamily: AppConstant.fontFamily, color: AppColor.secondary),
      iconTheme: IconThemeData(color: AppColor.secondary));

  static final TextTheme _textThemeLight = CustomTextTheme.primaryLight;
  static final TextTheme _textThemeDark = CustomTextTheme.primaryDark;

  static final InputDecorationTheme _inputDecorationThemeLight =
      CustomTextFieldTheme.primaryLight;
  static final InputDecorationTheme _inputDecorationThemeDark =
      CustomTextFieldTheme.primaryDark;

  static final TextButtonThemeData _textButtonThemeLight =
      CustomTextButtonTheme.primaryLight;
  static final TextButtonThemeData _textButtonThemeDark =
      CustomTextButtonTheme.primaryDark;

  static final CheckboxThemeData _checkBoxThemeLight =
      CustomCheckBoxTheme.primaryLight;
  static final CheckboxThemeData _checkBoxThemeDark =
      CustomCheckBoxTheme.primaryDark;

  static final ListTileThemeData _listTileThemeData = ListTileThemeData(
    dense: true,
    iconColor: AppColor.greyDark,
    textColor: AppColor.greyDark,
    selectedColor: Colors.white,
    minLeadingWidth: 15,
    contentPadding: const EdgeInsets.only(left: 16, right: 16),
  );

  static final ExpansionTileThemeData _expansionTileThemeData =
      ExpansionTileThemeData(
    iconColor: Colors.white,
    textColor: Colors.white,
    collapsedIconColor: AppColor.greyDark,
    collapsedTextColor: AppColor.greyDark,
    tilePadding: const EdgeInsets.only(left: 16, right: 16),
  );

  static final TabBarTheme _tabBarTheme = TabBarTheme(
      labelColor: Colors.black.withOpacity(0.85),
      unselectedLabelColor: Colors.black.withOpacity(0.50),
      dividerColor: AppColor.primary,
      indicatorColor: AppColor.primary,
      indicatorSize: TabBarIndicatorSize.label,
      labelPadding: const EdgeInsets.only(right: 0, left: 0),
      labelStyle: const TextStyle(
        fontFamily: AppConstant.fontFamily,
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
      unselectedLabelStyle: const TextStyle(
        fontFamily: AppConstant.fontFamily,
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ));

  static final DividerThemeData _dividerThemeData =
      DividerThemeData(color: AppColor.grey1, thickness: 1);

  static final ScrollbarThemeData _scrollbarTheme = ScrollbarThemeData(
    thickness: MaterialStateProperty.all<double>(6),
    thumbColor: MaterialStateProperty.all<Color>(AppColor.grey4),
    radius: const Radius.circular(30),
  );
}
