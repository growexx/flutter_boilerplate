import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/authentication/user_repository.dart';
import 'package:flutter_boilerplate/view/screens/settings/settings_screen.dart';
import 'package:flutter_boilerplate/view/screens/settings/widget/custom_tile.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:network_image_mock/network_image_mock.dart';
import 'package:nock/nock.dart';
import 'package:provider/provider.dart';

import '../../../util/common_initial_activity.dart';
import '../../../util/testing_material_app.dart';

void main() async {
  await commonInitialActivity();
  setUp(() {
    nock.cleanAll();
  });
  setUpAll(() {
    nock.init();
  });
  Widget widget = testingMaterial(initialLocation: SettingsPage.path);
  testWidgets(
    "setting screen testing is done",
    (WidgetTester tester) async {
      await mockNetworkImagesFor(() => tester.pumpWidget(
          (ChangeNotifierProvider(
              create: (context) => UserRepository(), child: widget))));
      expect(find.byType(Icon), findsWidgets);
    },
  );
  testWidgets(
    "setting screen testing is done for tap",
    (WidgetTester tester) async {
      tester.view.physicalSize = const Size(1280 * 7, 720 * 7);
      await mockNetworkImagesFor(() => tester.pumpWidget(
          (ChangeNotifierProvider(
              create: (context) => UserRepository(), child: widget))));
      expect(find.byType(Icon), findsWidgets);
      await tester.tap(find.byType(CustomListTile).at(0));
      await tester.tap(find.byType(CustomListTile).at(1));
      await tester.tap(find.byType(CustomListTile).at(2));
      await tester.tap(find.byType(CustomListTile).at(3));
      await tester.tap(find.byType(CustomListTile).at(4));
      await tester.tap(find.byType(CustomListTile).at(5));
      await tester.tap(find.byType(CustomListTile).at(6));
      await tester.tap(find.byType(CustomListTile).at(7));
      await tester.tap(find.byType(CustomListTile).at(8));
      await tester.tap(find.byType(CustomListTile).at(9));
      await tester.tap(find.byType(IconButton).first);
      addTearDown(tester.view.resetPhysicalSize);
    },
  );
}
