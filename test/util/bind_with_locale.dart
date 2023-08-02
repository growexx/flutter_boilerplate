




import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_boilerplate/app_manager/locale/locale_provider.dart';

Widget bindWithLocale({
  required Widget child
}) {
  return  EasyLocalization(
    supportedLocales: LocaleHelper.supportedLocales,
    path: LocaleHelper.path,
    fallbackLocale: LocaleHelper.fallbackLocale,
    child: child,
  );
}
