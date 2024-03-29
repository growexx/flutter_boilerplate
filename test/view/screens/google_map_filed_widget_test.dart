import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/view/screens/google_map/google_map_screen.dart';
import 'package:flutter_boilerplate/view/screens/google_map/widget/google_map_field_widget.dart';
import 'package:flutter_boilerplate/view_model/google_map_view_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';
import '../../util/common_initial_activity.dart';
import '../../util/testing_material_app.dart';
import 'google_map_widget_test.mocks.dart';

@GenerateNiceMocks([
  MockSpec<GoogleMapViewModel>(
      as: #MockGoogleMapInnerViewModel,
      onMissingStub: OnMissingStub.returnDefault),
])
void main() async {
  await commonInitialActivity();
  TestWidgetsFlutterBinding.ensureInitialized();

  group("Google Map Field Widget test", () {
    testWidgets('Google Map Field Widget test', (WidgetTester tester) async {
      MockGoogleMapInnerViewModel mockModel = MockGoogleMapInnerViewModel();

      expect(find.byKey(const Key("google_map")), findsNothing);
      expect(find.byKey(const Key("your_location")), findsNothing);
      expect(find.byKey(const Key("address_value")), findsNothing);

      when(mockModel.currentAddress).thenReturn("B25, Dummy Address");
      // when(mockModel.latLngForWeb)
      //     .thenAnswer((realInvocation) => const LatLng(23.033863, 72.585022));
      // when(mockModel.kGooglePlex).thenReturn(CameraPosition(
      //     target: mockModel.latLngForWeb, bearing: 192, tilt: 2, zoom: 12));
      when(mockModel.currentPosition).thenReturn(Position(
          latitude: 23.033863,
          longitude: 72.585022,
          accuracy: 0.5,
          speed: 0.0,
          floor: null,
          altitude: 0.0,
          heading: 0.0,
          speedAccuracy: 0.0,
          isMocked: false,
          timestamp: DateTime.now()));
      when(mockModel.kGooglePlex).thenReturn(
          const CameraPosition(target: LatLng(23.033863, 72.585022)));

      await tester.pumpWidget(
        MultiProvider(
            providers: [
              ChangeNotifierProvider<GoogleMapViewModel>.value(value: mockModel)
            ],
            child: MaterialApp(
              home: GoogleMapFieldWidget(viewModel: mockModel),
            )),
      );

      expect(find.byKey(const Key("center")), findsNothing);
      expect(find.byKey(const Key("cp_indicator")), findsNothing);

      expect(find.byKey(const Key("google_map")), findsOneWidget);
      expect(find.byKey(const Key("your_location")), findsOneWidget);
      expect(find.byKey(const Key("address_value")), findsOneWidget);
    });

    testWidgets(
        'Google Map Filed Widget Test - Android: On web displaying text for the right side portion and in mobile displaying map in that area',
        (WidgetTester tester) async {
      debugDefaultTargetPlatformOverride = TargetPlatform.android;
      Widget widget = testingMaterial(initialLocation: GoogleMapScreen.path);
      await tester.pumpWidget(widget);
      expect(find.byKey(const Key("text_map_functionality")), findsNothing);
      debugDefaultTargetPlatformOverride = null;
    });

    testWidgets(
        'Google Map Filed Widget Test - iOS: On web displaying text for the right side portion and in mobile displaying map in that area',
        (WidgetTester tester) async {
      debugDefaultTargetPlatformOverride = TargetPlatform.iOS;
      Widget widget = testingMaterial(initialLocation: GoogleMapScreen.path);
      await tester.pumpWidget(widget);
      expect(find.byKey(const Key("text_map_functionality")), findsNothing);
      debugDefaultTargetPlatformOverride = null;
    });
  });
}
