import 'package:flutter_boilerplate/util/location_utils/location_utils.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:geolocator/geolocator.dart';
import 'package:mockito/mockito.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

Position get mockPosition => Position(
    latitude: 52.561270,
    longitude: 5.639382,
    timestamp: DateTime.fromMillisecondsSinceEpoch(
      500,
      isUtc: true,
    ),
    altitude: 3000.0,
    altitudeAccuracy: 0.0,
    accuracy: 0.0,
    heading: 0.0,
    headingAccuracy: 0.0,
    speed: 0.0,
    speedAccuracy: 0.0);

void main() {
  group('Geolocator', () {
    setUp(() {
      GeolocatorPlatform.instance = MockGeolocatorPlatform();
    });

    test('handleLocationPermission returns true when permission is granted', () async {
      final result = await handleLocationPermission();
      expect(result, true);
    });

    test('isLocationServiceEnabled returns true when permission is granted', () async {
      final result = await isLocationServiceEnabled();
      expect(result, true);
    });

    test('getCurrentPosition returns true when permission is granted', () async {
      final result = await getCurrentPosition();
      expect(result, mockPosition);
    });

    test('getAddressFromLatLng returns true when permission is granted', () async {
      final result = await getAddressFromLatLng(mockPosition);
      expect(result, null);
    });


  });

  group('GeolocatorFalse', () {
    setUp(() {
      GeolocatorPlatform.instance = MockGeolocatorPlatformFalse();
    });

    test('handleLocationPermission returns true when permission is granted', () async {
      final result = await handleLocationPermission();
      expect(result, false);
    });

    test('isLocationServiceEnabled returns true when permission is granted', () async {
      final result = await isLocationServiceEnabled();
      expect(result, false);
    });

    test('getCurrentPosition returns true when permission is granted', () async {
      final result = await getCurrentPosition();
      expect(result, null);
    });

    test('getAddressFromLatLng returns true when permission is granted', () async {
      final result = await getAddressFromLatLng(mockPosition);
      expect(result, null);
    });


  });


}

class MockGeolocatorPlatform extends Mock
    with
    // ignore: prefer_mixin
        MockPlatformInterfaceMixin
    implements
        GeolocatorPlatform {
  @override
  Future<LocationPermission> checkPermission() =>
      Future.value(LocationPermission.whileInUse);

  @override
  Future<LocationPermission> requestPermission() =>
      Future.value(LocationPermission.whileInUse);

  @override
  Future<bool> isLocationServiceEnabled() => Future.value(true);

  @override
  Future<Position> getCurrentPosition({
    LocationSettings? locationSettings,
  }) =>
      Future.value(mockPosition);
}

class MockGeolocatorPlatformFalse extends Mock
    with
    // ignore: prefer_mixin
        MockPlatformInterfaceMixin
    implements
        GeolocatorPlatform {
  @override
  Future<LocationPermission> checkPermission() =>
      Future.value(LocationPermission.denied);

  @override
  Future<LocationPermission> requestPermission() =>
      Future.value(LocationPermission.denied);

  @override
  Future<bool> isLocationServiceEnabled() => Future.value(false);

  @override
  Future<Position> getCurrentPosition({
    LocationSettings? locationSettings,
  }) =>
      Future.value(mockPosition);
}
