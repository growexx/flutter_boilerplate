# Boilerplate Project

A boilerplate project created in flutter using MobX and Provider. To clone the branches use:

* https://github.com/growexx/flutter_boilerplate

## Getting Started

The Boilerplate contains the minimal implementation required to create a new library or project. The repository code is preloaded with some basic components like basic app architecture, app theme, constants and required dependencies to create a new project. By using boiler plate code as standard initializer, we can have same patterns in all the projects that will inherit it. This will also help in reducing setup & development time by allowing you to use same code pattern and avoid re-writing from scratch.

## How to Use

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
* Login
* Dashboard
* Go Router
* Provider (State Management)
* Encryption
* Validation
* Code Generation
* User Notifications
* Logging
* Dark Theme Support 
* Multilingual Support


### SplashScreen:
Splash Screen is the first page user see when application opens up, in this code a animated logo and app title added on the splash screen, you can add as much animation and do changes according to the UI.

### ThemeModeSelector and Dark Theme:
The project contains the drk and light mode ThemeProvider is used to control the theme of the project you can select `systme`, `light` or `dark` mode, You can control it by using ThemeModeSelector Widget that controls the ThemeProvider

### Libraries & Tools Used

* [http](https://pub.dev/packages/http)
* [delayed_widget](https://pub.dev/packages/delayed_widget)
* [easy_localization](https://pub.dev/packages/easy_localization)
* [encrypt](https://pub.dev/packages/encrypt)
* [flutter_dotenv](https://pub.dev/packages/flutter_dotenv)
* [flutter_gen](https://pub.dev/packages/flutter_gen)
* [go_router](https://pub.dev/packages/go_router)
* [Provider](https://pub.dev/packages/provider) (State Management)
* [shared_preferences](https://pub.dev/packages/shared_preferences)


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
import 'package:flutter_boilerplate/view/screens/login_screen.dart';
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


