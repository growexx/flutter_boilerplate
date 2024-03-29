# Boilerplate Project

A boilerplate project created in flutter using MobX and Provider. To clone the branches use:

* https://github.com/growexx/flutter_boilerplate

## Getting Started

The Boilerplate contains the minimal implementation required to create a new library or project. The repository code is preloaded with some basic components like basic app architecture, app theme, constants and required dependencies to create a new project. By using boiler plate code as standard initializer, we can have same patterns in all the projects that will inherit it. This will also help in reducing setup & development time by allowing you to use same code pattern and avoid re-writing from scratch.

## How to Use

**Step 0:**

Initial step before cloning the boilerPlate and using it you need to install flutter in your system different system required different sdk and installation methods, to know more about this please visit below link:

```
https://docs.flutter.dev/get-started/install
```

**Step 1:**

Download or clone this repo by using the link below:

```
https://github.com/growexx/flutter_boilerplate
```

**Step 2:**

Go to project root and execute the following command in console to get the required dependencies:

```
flutter pub get 
```

**Step 3:**

This project uses `flutter_gen` library that works with code generation, execute the following command to generate files:

```
fdart pub global activate flutter_gen
```

## Boilerplate Features:

* SplashScreen
* ThemeModeSelector and Dark Theme
* LocaleSelector and LocaleProvider
* SignUp
* Social SignIn with Google, Apple, Twitter, Instagram, Facebook
* SignIn with Email & Password
* SignIn with OTP
* Forgot Password
* Dashboard
* User Profile & Edit Profile
* Change Password
* Go Router
* Provider (State Management)
* Encryption
* Validation
* Code Generation
* User Notifications
* Google Map
* Security PIN
* Settings
* Logging
* Dark Theme Support 
* Multilingual Support
* Push Notification
* Chat
* To-do UI

### SplashScreen:
Splash Screen is the first page user see when application opens up, in this code a animated logo and app title added on the splash screen, you can add as much animation and do changes according to the UI.
<p align='center'>
    <img src="github_assets/splash_screen.png" width="600"/>
</p>

### ThemeModeSelector and Dark Theme:
The project contains the drk and light mode ThemeProvider is used to control the theme of the project you can select `systme`, `light` or `dark` mode, You can control it by using ThemeModeSelector Widget that controls the ThemeProvider,
We have created a controller to control theme
<p align='center'>
    <img src="github_assets/theme_and_locale.png" width="600"/>
</p>

### LocaleSelector and LocalProvider:
The project using `easy_localization` for locale management, It contains a LocaleHelper file to manage the all the locales and fallback locale and LocalSelectorWidget help you select the locale.
We have created a controller to control locale
<p align='center'>
    <img src="github_assets/theme_and_locale.png" width="600"/>
</p>

### SocialSignIn:
Google signin is available for web, android and ios.
Apple signin is available for web, android and ios.
Twitter signin is available for android and ios.
Facebook signin is available for android and ios.
Instagram signin is available for android and ios.

App or websites needs to be live for most of them to work.

### SigninWithEmailAndOTP:
This project contains the UI design and implementation for both signin with email and signin with OTP, that can help you save time in redesigning the screens.
<p align='center'>
    <img src="github_assets/email_signin.png" width="200"/>
    <img src="github_assets/otp_signin.png" width="200"/>
</p>

### StateManagement(Provider):
For StateManagement we have used provider package, you can use any other state management to the project is configured that way that you can easily change state management,
provider gives you reactive programming that help reduce the process time and memory consumption.
CheckOut provider here:
```
https://pub.dev/packages/provider
```

### Libraries & Tools Used

* [http](https://pub.dev/packages/http)
* [delayed_widget](https://pub.dev/packages/delayed_widget)
* [easy_localization](https://pub.dev/packages/easy_localization)
* [encrypt](https://pub.dev/packages/encrypt)
* [firebase_core](https://pub.dev/packages/firebase_core)
* [flutter_dotenv](https://pub.dev/packages/flutter_dotenv)
* [flutter_gen](https://pub.dev/packages/flutter_gen)
* [go_router](https://pub.dev/packages/go_router)
* [google_sign_in](https://pub.dev/packages/google_sign_in)
* [Provider](https://pub.dev/packages/provider) (State Management)
* [shared_preferences](https://pub.dev/packages/shared_preferences)
* [sign_in_with_apple](https://pub.dev/packages/sign_in_with_apple)
* [image_picker](https://pub.dev/packages/image_picker)
* [image_picker_for_web](https://pub.dev/packages/image_picker_web#imagepickerweb)
* [image_cropper](https://pub.dev/packages/image_cropper)
* [nock](https://pub.dev/packages/nock)
* [otp_timer_button](https://pub.dev/packages/otp_timer_button)
* [mockito](https://pub.dev/packages/mockito)
* [json_serializable](https://pub.dev/packages/json_serializable)
* [flutter_lints](https://pub.dev/packages/flutter_lints)
* [uuid](https://pub.dev/packages/uuid)
* [intl](https://pub.dev/packages/intl)
* [json_annotation](https://pub.dev/packages/json_annotation)
* [hive_generator](https://pub.dev/packages/hive_generator)
* [hive_flutter](https://pub.dev/packages/hive_flutter)
* [hive](https://pub.dev/packages/hive)
* [custom_pin_screen](https://pub.dev/packages/custom_pin_screen)
* [cloud_firestore](https://pub.dev/packages/cloud_firestore)
* [jiffy](https://pub.dev/packages?q=jiffy)
* [flutter_stripe](https://pub.dev/packages/flutter_stripe)
* [pin_code_text_field](https://pub.dev/packages/pin_code_text_field)
* [pay](https://pub.dev/packages/pay)
* [mocktail_image_network](https://pub.dev/packages/mocktail_image_network)
* [network_image_mock](https://pub.dev/packages/network_image_mock)
* [geocoding](https://pub.dev/packages/geocoding)
* [geolocator](https://pub.dev/packages/geolocator)
* [google_maps_flutter](https://pub.dev/packages/google_maps_flutter)
* [google_maps_flutter_web](https://pub.dev/packages/google_maps_flutter_web)

### Folder Structure
Here is the core folder structure which flutter provides.

```
flutter-app/
|- android
|- build
|- ios
|- lib
|- test
```

Here is the folder structure we have been using in this project

```
lib/
|- app_manager/
|- authentication/
|- gen/
|- go_router/
|- util/
|- view/
|- main.dart
|- routes.dart
```

Now, lets dive into the lib folder which has the main code for the application.

```
1- app_manager - all the files that are used to define the project structure theme api call service methods all are in this folder.
2- authentication - Contains all the user authentication related code.
3- gen - Generated by using flutter_gen for asset generation.
4- go_router - Contains code related to go router like error screen for web.
5- util - Contains the utilities/common functions of your application.
6- view - Contains all the screen that are visible to the user.
7- main.dart - This is the starting point of the application. All the application level configurations are defined in this file i.e, theme, routes, title, orientation etc.
8- routes.dart - This file contains all the routes for your application.
```

### AppManager

All the files that are used to define the project structure theme api call service methods all are in this folder:

```
app_manager/
|- animation
|- component
|- constant
|- extension
|- helper
|- locale
|- service
|- theme
```

### Authentication

Contains all the user authentication related code.

```
authentcation/
|- user.dart
|- user_repository.dart

```

### gen

Generated by using flutter_gen for asset generation.

### go_router

Contains code related to go router like error screen for web:

``` 

go_router/
|- error_screen.dart

```

### util

Contains the utilities/common functions of your application.

```
utils/
|- check_login_status.dart

```

### View

Contains all the screen that are visible to the user.

```
view/
|- screens/
    |- splash_screen.dart
    |- login_screen.dart
    |- dashboard_screen.dart

```

### Routes

This file contains all the routes for your application.

```dart
import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/view/screens/dashboard_screen.dart';
import 'package:flutter_boilerplate/view/screens/security_pin_support_screen.dart';
import 'package:flutter_boilerplate/view/screens/splash_screen.dart';
import 'package:go_router/go_router.dart';

CustomTransitionPage buildPageWithDefaultTransition<T>({
  required BuildContext context,
  required GoRouterState state,
  required Widget child,
}) {
  return CustomTransitionPage<T>(
    key: state.pageKey,
    child: child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) =>
        FadeTransition(
          opacity:
          CurveTween(curve: Curves.easeInOutCirc).animate(animation),
          child: SelectionArea(
              child: child),
        ),
  );
}


List<RouteBase> routes = [
  GoRoute(
    name: SplashScreen.name,
    path: SplashScreen.path,
    pageBuilder: (context, state) => buildPageWithDefaultTransition(
        context: context, state: state,
        child: const SplashScreen()),
  ),
  GoRoute(
    name: LoginScreen.name,
    path: LoginScreen.path,
    pageBuilder: (context, state) => buildPageWithDefaultTransition(
        context: context, state: state,
        child: const LoginScreen()),
  ),
  GoRoute(
    name: DashboardScreen.name,
    path: DashboardScreen.path,
    pageBuilder: (context, state) => buildPageWithDefaultTransition(
        context: context, state: state,
        child: const DashboardScreen()),
  ),
];
```

### Main

This is the starting point of the application. All the application level configurations are defined in this file i.e, theme, routes, title, orientation etc.

```dart
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
  User user = await UserRepository.fetchUserData();
  runApp(
      ChangeNotifierProvider<UserRepository>(
          create: (_) => UserRepository(currentUser: user),
          child: const MyApp())
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: router,
      theme: ThemeProvider.lightTheme,
      darkTheme: ThemeProvider.darkTheme,
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
```

## GitHub

Checkout [github](https://github.com/growexx/flutter_boilerplate)


## Conclusion

This boilerplate will help you learn and keep with new updates of flutter, for any help and adding your own code, you can contact us.