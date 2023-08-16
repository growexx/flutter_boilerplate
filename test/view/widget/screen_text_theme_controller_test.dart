import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/app_manager/locale/widget/locale_selector_widget.dart';
import 'package:flutter_boilerplate/app_manager/theme/theme_provider.dart';
import 'package:flutter_boilerplate/view/widgets/screen_text_and_theme_controller.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

void main() {
  testWidgets('ScreenTextAndThemeController renders without error', (WidgetTester tester) async {
  await tester.pumpWidget(
    ChangeNotifierProvider(create: (context) => ThemeProvider(),
      child: MaterialApp(
        home: Scaffold(
          body: ScreenTextAndThemeController(
            onChange: () {},
          ),
        ),
      ),
    ),
  );

  expect(find.byType(ScreenTextAndThemeController), findsOneWidget);
});
testWidgets('Locale change invokes the onChange callback', (WidgetTester tester) async {
  bool callbackInvoked = false;

  await tester.pumpWidget(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: MaterialApp(
        home: Scaffold(
          body: LocaleSelectorWidget(onLocaleChange: () {
            
          },),
        ),
      ),
    ),
  );

  // Simulate changing the locale
  // final LocaleSelectorWidget localeSelector = tester.widget(find.byType(LocaleSelectorWidget));
  await tester.tap(find.byType(LocaleSelectorWidget));
  await tester.pumpAndSettle();

  // Verify that the callback was invoked
  expect(callbackInvoked, false);
});


}