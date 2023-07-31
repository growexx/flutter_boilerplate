import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/view/widgets/welcome.dart';
import 'package:flutter_test/flutter_test.dart';
import '../../util/common_initial_activity.dart';

void main() async {
  await commonInitialActivity();
  TestWidgetsFlutterBinding.ensureInitialized();

  group("Welcome Widget (Web Sample Widget) Test", () {
    testWidgets('sign-in screen', (WidgetTester tester) async {
      Widget widget = const MaterialApp(home:WelcomeWidget());
      await tester.pumpWidget(widget);
      expect(find.byKey(const Key("welcome")), findsOneWidget);
      expect(find.byKey(const Key("align")), findsOneWidget);
      expect(find.byKey(const Key("bg_stack")), findsOneWidget);
      expect(find.byKey(const Key("sb_wallpaper")), findsOneWidget);
      expect(find.byKey(const Key("description1")), findsOneWidget);
      expect(find.byKey(const Key("description2")), findsOneWidget);

      await tester.pumpAndSettle(const Duration(seconds: 2));
      await tester.pumpAndSettle();
    });
  });
}
