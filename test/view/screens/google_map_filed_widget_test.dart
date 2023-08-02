import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/view/screens/google_map/widget/google_map_field_widget.dart';
import 'package:flutter_boilerplate/view_model/google_map_view_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import '../../util/common_initial_activity.dart';
import '../../util/testing_material_app.dart';
import 'google_map_filed_widget_test.mocks.dart';

@GenerateNiceMocks([
  MockSpec<GoogleMapViewModel>(
      as: #MockGoogleMapViewModel, onMissingStub: OnMissingStub.returnDefault),
])
void main() async {
  await commonInitialActivity();
  TestWidgetsFlutterBinding.ensureInitialized();

  group("Google Map Widget test", () {
    testWidgets('Google Map Widget test', (WidgetTester tester) async {
      MockGoogleMapViewModel mockGoogleMapViewModel = MockGoogleMapViewModel();
      /*when(mockOTPViewModel.phoneC)
          .thenAnswer((realInvocation) => TextEditingController());*/
      Widget widget = testingWidget(
          child: GoogleMapFieldWidget(
            key:const Key("12"),
            viewModel: mockGoogleMapViewModel
          ));

      await tester.pumpWidget(widget);

      expect(find.byKey(const Key("google_map_widget")), findsOneWidget);
      expect(find.byKey(const Key("center")), findsOneWidget);
      expect(find.byKey(const Key("cp_indicator")), findsOneWidget);
      expect(find.byKey(const Key("text_map_functionality")), findsOneWidget);
    });
  });
}
