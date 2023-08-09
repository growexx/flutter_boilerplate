import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/view/screens/google_map/google_map_screen.dart';
import 'package:flutter_test/flutter_test.dart';
import '../../util/common_initial_activity.dart';
import '../../util/testing_material_app.dart';

void main() async {
  await commonInitialActivity();
  TestWidgetsFlutterBinding.ensureInitialized();

  group("Google-Map Screen Test", () {
    testWidgets('Google-Map screen test', (WidgetTester tester) async {
      Widget widget = testingMaterial(initialLocation: GoogleMapScreen.path);
      await tester.pumpWidget(widget);

      // expect(find.byKey(const Key("center")), findsOneWidget);
      expect(find.byKey(const Key("cp_indicator")), findsOneWidget);

    });
  });
}
