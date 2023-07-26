


import 'package:flutter/cupertino.dart';
import 'package:flutter_boilerplate/app_manager/theme/theme_provider.dart';
import 'package:flutter_boilerplate/authentication/user_repository.dart';
import 'package:provider/provider.dart';

Widget bindWithCommonProvider({
  required Widget child
}) {
  return  MultiProvider(
    providers: [
      ChangeNotifierProvider<UserRepository>(
        create: (_) => UserRepository(),),
      ChangeNotifierProvider<ThemeProvider>(
        create: (_) => ThemeProvider(),),
    ],
    child: child,
  );
}