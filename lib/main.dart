import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/app_manager/constant/app_constant.dart';
import 'package:flutter_boilerplate/app_manager/constant/environment.dart';
import 'package:flutter_boilerplate/app_manager/locale/locale_provider.dart';
import 'package:flutter_boilerplate/app_manager/models/todo_data.dart';
import 'package:flutter_boilerplate/app_manager/service/navigation_service.dart';
import 'package:flutter_boilerplate/app_manager/theme/app_color.dart';
import 'package:flutter_boilerplate/app_manager/theme/theme_provider.dart';
import 'package:flutter_boilerplate/authentication/user.dart';
import 'package:flutter_boilerplate/authentication/user_repository.dart';
import 'package:flutter_boilerplate/go_router/error_screen.dart';
import 'package:flutter_boilerplate/util/push_notifications.dart';
import 'package:flutter_boilerplate/routes.dart';
import 'package:flutter_boilerplate/view_model/chat_view_model.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:flutter/foundation.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // use usePathUrlStrategy to remove # from url path
  usePathUrlStrategy();
  // initializing Locale
  await EasyLocalization.ensureInitialized();
  // loading .env file
  await dotenv.load(fileName: ".env");
  //Initiating FireBase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // FaceBook Initialise
  if (kIsWeb || defaultTargetPlatform == TargetPlatform.macOS) {
    // await FacebookAuth.instance.webAndDesktopInitialize(
    //   appId: dotenv.env[Environment.appId]!,
    //   cookie: true,
    //   xfbml: true,
    //   version: "v15.0",
    // );
  }
  if (defaultTargetPlatform == TargetPlatform.iOS &&
      defaultTargetPlatform == TargetPlatform.android) {
    await FirebasePushNotifications().initNotifications();
  }
  // fetching user details
  User user = await UserRepository.fetchUserData();
  // fetching stored theme model
  ThemeMode themeMode = await ThemeProvider.retrieveStoredTheme();
  Stripe.publishableKey = Environment.stripePublishableKey;
  Stripe.merchantIdentifier = 'YOUR_MERCHANT_ID';
  await Hive.initFlutter();
  Hive.registerAdapter(TodoDataAdapter());
  await Hive.openBox('todo_db');

  runApp(EasyLocalization(
    supportedLocales: LocaleHelper.supportedLocales,
    path: LocaleHelper.path,
    fallbackLocale: LocaleHelper.fallbackLocale,
    child: MultiProvider(
      providers: [
        ChangeNotifierProvider<UserRepository>(
          create: (_) => UserRepository(currentUser: user),
        ),
        ChangeNotifierProvider<ThemeProvider>(
          create: (_) => ThemeProvider(themeMode: themeMode),
        ),
      ],
      child: ChangeNotifierProvider<UserRepository>(
          create: (_) => UserRepository(currentUser: user),
          child: const MyApp()),
    ),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      routerConfig: router,
      theme: ThemeProvider.lightTheme,
      darkTheme: ThemeProvider.darkTheme,
      themeMode: themeProvider.themeMode,
      title: AppConstant.appNameString,
      builder: (context, widget) {
        return Container(
          color: AppColor.primary,
          child: SafeArea(child: widget ?? Container()),
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
