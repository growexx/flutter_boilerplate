import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/view/screens/signup/widget/select_image_options_widget.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:image_picker/image_picker.dart';
import '../../util/common_initial_activity.dart';
import '../../util/testing_material_app.dart';

void main() async {
  await commonInitialActivity();
  TestWidgetsFlutterBinding.ensureInitialized();

  group("SelectImageOptions Widget test", () {
    testWidgets('SelectImageOptions Widget widget', (WidgetTester tester) async {
      Widget widget = testingWidget(
          child: SelectImageOptionsScreen(
        onTap: (ImageSource source) {},
      ));

      await tester.pumpWidget(widget);

      expect(find.byKey(const Key("key_container")), findsOneWidget);
      expect(find.byKey(const Key("key_browse_gallery")), findsOneWidget);
      expect(find.byKey(const Key("key_or")), findsOneWidget);
      expect(find.byKey(const Key("key_use_a_camera")), findsOneWidget);
    });
  });
}
