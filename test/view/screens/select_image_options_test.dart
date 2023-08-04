import 'package:flutter_test/flutter_test.dart';
import '../../util/common_initial_activity.dart';

void main() async {
  await commonInitialActivity();
  TestWidgetsFlutterBinding.ensureInitialized();

  group("SelectImageOptions Widget test", () {
    testWidgets('SelectImageOptions Widget widget', (WidgetTester tester) async {
     /* Widget widget = testingWidget(
          child: const SelectImageOptionsScreen(
            key: Key("12"),
            onTap: (source) => Function(ImageSource source) ,
          ));

      await tester.pumpWidget(widget);

      expect(find.byKey(const Key("key_container")), findsOneWidget);
      expect(find.byKey(const Key("key_browse_gallery")), findsOneWidget);
      expect(find.byKey(const Key("key_or")), findsOneWidget);
      expect(find.byKey(const Key("key_use_a_camera")), findsOneWidget);*/
    });
  });
}
