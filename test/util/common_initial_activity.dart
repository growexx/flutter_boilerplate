



import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_boilerplate/app_manager/locale/locale_provider.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
// ignore: depend_on_referenced_packages
import 'package:easy_logger/easy_logger.dart';
import 'dart:convert';
import 'dart:io';
import 'package:easy_localization/src/localization.dart';
import 'package:easy_localization/src/translations.dart';
import 'package:flutter/widgets.dart';



Future<void> commonInitialActivity() async{
    TestWidgetsFlutterBinding.ensureInitialized();
    SharedPreferences.setMockInitialValues({});
    EasyLocalization.logger.enableLevels = <LevelMessages>[
        LevelMessages.error,
        LevelMessages.warning,
    ];
    await EasyLocalization.ensureInitialized();
    await _testExecutable();
}


Future<void> _testExecutable() async {
    final content = await File('${LocaleHelper.path}/en-US.json').readAsString(); // <- Or `ru.json`
    final data = jsonDecode(content) as Map<String, dynamic>;

    // easy_localization works with a singleton instance internally. We abuse
    // this fact in tests and just let it load the English translations.
    // Therefore we don't need to deal with any wrapper widgets and
    // waiting/pumping in our widget tests.
    Localization.load(
        const Locale('en-US'),
        translations: Translations(data),
    );
}