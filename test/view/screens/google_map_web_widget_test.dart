import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/view/screens/google_map/widget/google_map_web_page_filler_widget.dart';
import 'package:flutter_boilerplate/view_model/google_map_view_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';
import '../../util/common_initial_activity.dart';
import 'google_map_widget_test.mocks.dart';

@GenerateNiceMocks([
  MockSpec<GoogleMapViewModel>(
      as: #MockGoogleMapInnerViewModel, onMissingStub: OnMissingStub.returnDefault),
])
void main() async {
  await commonInitialActivity();
  TestWidgetsFlutterBinding.ensureInitialized();

  group("Google Map Field Widget test", () {
    testWidgets('Google Map Field Widget test', (WidgetTester tester) async {
      MockGoogleMapInnerViewModel mockModel = MockGoogleMapInnerViewModel();

      expect(find.byKey(const Key("google_map")), findsNothing);

      when(mockModel.latLngForWeb)
          .thenAnswer((realInvocation) => const LatLng(23.033863, 72.585022));
      when(mockModel.kGooglePlex).thenReturn(CameraPosition(
          target: mockModel.latLngForWeb, bearing: 192, tilt: 2, zoom: 12));
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

      await tester.pumpWidget(
        MultiProvider(
            providers: [
              ChangeNotifierProvider<GoogleMapViewModel>.value(value: mockModel)
            ],
            child: MaterialApp(
              home: GoogleMapWebPageFillerWidget(viewModel: mockModel),
            )),
      );

      expect(find.byKey(const Key("google_map")), findsOneWidget);

      tester.pumpAndSettle();
    });
  });
}
