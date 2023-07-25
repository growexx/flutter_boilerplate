import 'package:flutter/cupertino.dart';
import 'package:flutter_boilerplate/authentication/user_repository.dart';
import 'package:flutter_boilerplate/view/screens/dashboard_screen.dart';
import 'package:flutter_boilerplate/view/screens/login_screen.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

Future checkLoginStatus(BuildContext context,) async{
   await Future.delayed(const Duration(seconds: 1), () {
    Router.neglect(context, () =>
        context.goNamed(
            Provider.of<UserRepository>(context,listen: false).isLoggedIn?
            DashboardScreen.name:LoginScreen.name)
    );
  });
}