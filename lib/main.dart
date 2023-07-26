import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/app_manager/constant/app_constant.dart';
import 'package:flutter_boilerplate/app_manager/service/navigation_service.dart';
import 'package:flutter_boilerplate/app_manager/theme/app_color.dart';
import 'package:flutter_boilerplate/app_manager/theme/theme_provider.dart';
import 'package:flutter_boilerplate/authentication/user.dart';
import 'package:flutter_boilerplate/authentication/user_repository.dart';
import 'package:flutter_boilerplate/go_router/error_screen.dart';
import 'package:flutter_boilerplate/routes.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_web_plugins/url_strategy.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  // use usePathUrlStrategy to remove # from url path
  usePathUrlStrategy();
  // loading .env file
  await dotenv.load(fileName: ".env");
  // fetching user details
  User user = await UserRepository.fetchUserData();
  // fetching stored theme model
  ThemeMode themeMode = await ThemeProvider.retrieveStoredTheme();
  
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<UserRepository>(
        create: (_) => UserRepository(currentUser: user),),
      ChangeNotifierProvider<ThemeProvider>(
        create: (_) => ThemeProvider(themeMode: themeMode),),
    ],
    child: ChangeNotifierProvider<UserRepository>(
        create: (_) => UserRepository(currentUser: user),
        child: const MyApp()),
  )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: router,
      theme: ThemeProvider.lightTheme,
      darkTheme: ThemeProvider.darkTheme,
      themeMode: themeProvider.themeMode,
      title: AppConstant.appName,
      builder: (context, widget) {
        return Container(
          color: AppColor.primary,
          child: SafeArea(
              child: widget ?? Container()
          ),
        );
      },
    );
  }
}

GoRouter router = GoRouter(
  routes: routes,
  navigatorKey: NavigationService.navigatorKey,
  errorBuilder: (context, state) => const ErrorScreen(),
);



