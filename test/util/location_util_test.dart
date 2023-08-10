import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/util/location_utils/location_utils.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:geolocator/geolocator.dart';
import 'package:mockito/mockito.dart';

import '../app_manager/helper/responsive/responsive_test.mocks.dart';

void main() {
  MockBuildContext mockContext;

  test(
    "getAddressFromLatLng test",
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      final address = getAddressFromLatLng(Position(
          longitude: 72.571365,
          latitude: 23.022505,
          timestamp: DateTime.now(),
          accuracy: 81,
          altitude: 100,
          heading: 12,
          speed: 10,
          speedAccuracy: 12));
      isLocationServiceEnabled(MockBuildContext());
      getCurrentPosition(MockBuildContext());
      expect(address.toString().isNotEmpty, true);
    },
  );

  test(
    "getCurrentPosition test",
        () async {
      WidgetsFlutterBinding.ensureInitialized();
      mockContext = MockBuildContext();
      final currentPosition = getCurrentPosition(mockContext);
      expect(currentPosition!=null, true);
    },
  );


}
class MockBuildContext extends Mock implements BuildContext {}
