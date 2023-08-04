import 'package:flutter_boilerplate/view_model/google_map_view_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  test('GoogleMapViewModel test', () {
    final model = GoogleMapViewModel();
    model.currentAddress = "B25 Dummy Address";
    expect(model.currentAddress, "B25 Dummy Address");
    model.currentPosition =Position(
        latitude: 23.033863,
        longitude: 72.585022,
        accuracy: 0.5,
        speed: 0.0,
        floor: null,
        altitude: 0.0,
        heading: 0.0,
        speedAccuracy: 0.0,
        isMocked: false,
        timestamp: DateTime.parse('2023-08-03 03:04:05'));
    expect(model.currentPosition, Position(
        latitude: 23.033863,
        longitude: 72.585022,
        accuracy: 0.5,
        speed: 0.0,
        floor: null,
        altitude: 0.0,
        heading: 0.0,
        speedAccuracy: 0.0,
        isMocked: false,
        timestamp: DateTime.parse('2023-08-03 03:04:05')));
    model.latLngForWeb = const LatLng(23.033863, 72.585022);
    expect(model.latLngForWeb, const LatLng(23.033863, 72.585022));
    model.kGooglePlex = CameraPosition(
        target: model.latLngForWeb, bearing: 192, tilt: 2, zoom: 12);
    expect(model.kGooglePlex, CameraPosition(
        target: model.latLngForWeb, bearing: 192, tilt: 2, zoom: 12));
    model.setCurrentAddress = "address";
    expect(model.currentAddress, "address");
    model.setCurrentPosition=Position(
        latitude: 23.033863,
        longitude: 72.585022,
        accuracy: 0.5,
        speed: 0.0,
        floor: null,
        altitude: 0.0,
        heading: 0.0,
        speedAccuracy: 0.0,
        isMocked: false,
        timestamp: DateTime.parse('2023-08-03 03:04:05'));
    expect(model.currentPosition, Position(
    latitude: 23.033863,
    longitude: 72.585022,
        accuracy: 0.5,
        speed: 0.0,
        floor: null,
        altitude: 0.0,
        heading: 0.0,
        speedAccuracy: 0.0,
        isMocked: false,
        timestamp: DateTime.parse('2023-08-03 03:04:05')));
  });
}