



import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/app_manager/component/custom_drop_down.dart';
import 'package:flutter_boilerplate/app_manager/locale/locale_provider.dart';

class LocaleSelectorWidget extends StatelessWidget {
  final VoidCallback onLocaleChange;
  const LocaleSelectorWidget({super.key, required this.onLocaleChange});

  @override
  Widget build(BuildContext context) {
    Locale getSelectedLocale() {
      try {
        return context.locale;
      } catch(e) {
        return LocaleHelper.fallbackLocale;
      }
    }
    return SizedBox(
      width: 150,
      child: CustomDropDown<Locale>(
        value: getSelectedLocale(),
          hint: "Select Locale",
          items: LocaleHelper.supportedLocales
              .map((e) => DropdownMenuItem<Locale>(
              value: e,
              key:  ValueKey(e.languageCode),
              child: Text(e.languageCode.toString()))).toList(),
          onChanged: (Locale? val) async{
            if(val!=null) {
              try {
                await context.setLocale(val).then((value) => onLocaleChange());
              } catch(e) {
                onLocaleChange();
              }
            }
          },
      ),
    );
  }
}
