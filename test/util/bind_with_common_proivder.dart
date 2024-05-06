import 'package:flutter/cupertino.dart';
import 'package:flutter_boilerplate/app_manager/theme/theme_provider.dart';
import 'package:flutter_boilerplate/authentication/user.dart';
import 'package:flutter_boilerplate/authentication/user_repository.dart';
import 'package:provider/provider.dart';

Widget bindWithCommonProvider({
  required Widget child,
  bool? withUser,
  User? user,
}) {
  return  MultiProvider(
    providers: [
      ChangeNotifierProvider<UserRepository>(
        create: (_) => UserRepository(
            currentUser: withUser==true? user??User(
                id: "1",
                firstName: "test",
                lastName: "name",
                email: "email@gmail.com",
            ):null
        ),),
      ChangeNotifierProvider<ThemeProvider>(
        create: (_) => ThemeProvider(),),
    ],
    child: child,
  );
}