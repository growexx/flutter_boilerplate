import 'package:flutter/cupertino.dart';
import 'package:flutter_boilerplate/authentication/user_repository.dart';
import 'package:flutter_boilerplate/view/screens/dashboard_screen.dart';
import 'package:flutter_boilerplate/view/screens/login/signin_screen.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

Future checkLoginStatus(BuildContext context,) async{
   await Future.delayed(const Duration(seconds: 1), () async{
     bool isLoggedIn = Provider.of<UserRepository>(context,listen: false).isLoggedIn;
    Router.neglect(context, () =>
        context.goNamed(
            isLoggedIn?
            DashboardScreen.name:SigninScreen.name)
    );
  });
}
