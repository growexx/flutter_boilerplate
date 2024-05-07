import 'package:flutter_boilerplate/view_model/google_map_view_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:geolocator/geolocator.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  test('GoogleMapViewModel test', () {
    final model = GoogleMapViewModel();
    model.currentAddress = "B25 Dummy Address";
    expect(model.currentAddress, "B25 Dummy Address");
    model.currentPosition = Position(
        latitude: 23.033863,
        longitude: 72.585022,
        accuracy: 0.5,
        speed: 0.0,
        floor: null,
        altitude: 0.0,
        heading: 0.0,
        speedAccuracy: 0.0,
        isMocked: false,
      timestamp: DateTime.parse('2023-08-03 03:04:05'),
      altitudeAccuracy: 0.0,
      headingAccuracy: 0.0,
    );
    expect(
        model.currentPosition,
        Position(
            latitude: 23.033863,
            longitude: 72.585022,
            accuracy: 0.5,
            speed: 0.0,
            floor: null,
            altitude: 0.0,
            heading: 0.0,
            speedAccuracy: 0.0,
            isMocked: false,
          timestamp: DateTime.parse('2023-08-03 03:04:05'),
          altitudeAccuracy: 0.0,
          headingAccuracy: 0.0,
        ));
    model.setCurrentAddress = "address";
    expect(model.currentAddress, "address");
    model.setCurrentPosition = Position(
        latitude: 23.033863,
        longitude: 72.585022,
        accuracy: 0.5,
        speed: 0.0,
        floor: null,
        altitude: 0.0,
        heading: 0.0,
        speedAccuracy: 0.0,
        isMocked: false,
      timestamp: DateTime.parse('2023-08-03 03:04:05'),
      altitudeAccuracy: 0.0,
      headingAccuracy: 0.0,
    );
    expect(
        model.currentPosition,
        Position(
            latitude: 23.033863,
            longitude: 72.585022,
            accuracy: 0.5,
            speed: 0.0,
            floor: null,
            altitude: 0.0,
            heading: 0.0,
            speedAccuracy: 0.0,
            isMocked: false,
          timestamp: DateTime.parse('2023-08-03 03:04:05'),
          altitudeAccuracy: 0.0,
          headingAccuracy: 0.0,
        ));
    model.setLocationServiceStatus = true;
    expect(model.isLocationServiceEnabled, true);
  });
}
