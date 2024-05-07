import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/util/location_utils/location_utils.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:mockito/mockito.dart';

class MockGeocodingPlatform extends GeocodingPlatform {
  final bool throwError;

  MockGeocodingPlatform({this.throwError = false});

  @override
  Future<List<Placemark>> placemarkFromCoordinates(
    double latitude,
    double longitude,
  ) async {
    if (throwError) {
      throw 'Error';
    }
    return [
      const Placemark(
        street: 'Street',
        subLocality: 'SubLocality',
        subAdministrativeArea: 'SubAdministrativeArea',
        postalCode: 'PostalCode',
      ),
    ];
  }
}

class MockGeoLocatorPlatform extends GeolocatorPlatform {
  final LocationPermission locationPermission;
  final bool isLocationEnabled;
  final bool throwError;
  MockGeoLocatorPlatform({
    this.locationPermission = LocationPermission.always,
    this.isLocationEnabled = true,
    this.throwError = false,
  });

  @override
  Future<bool> isLocationServiceEnabled() async {
    return isLocationEnabled;
  }

  @override
  Future<Position> getCurrentPosition({
    LocationSettings? locationSettings,
  }) async {
    if (throwError) {
      throw 'Error';
    }
    return Position(
      longitude: 72.571365,
      latitude: 23.022505,
      timestamp: DateTime.now(),
      accuracy: 81,
      altitude: 100,
      heading: 12,
      speed: 10,
      speedAccuracy: 12,
      altitudeAccuracy: 0.0,
      headingAccuracy: 0.0,
    );
  }

  @override
  Future<LocationPermission> checkPermission() async {
    return locationPermission;
  }

  @override
  Future<LocationPermission> requestPermission() async {
    return locationPermission;
  }
}

void main() {
  MockBuildContext mockContext;

  test(
    'getAddressFromLatLng test',
    () async {
      TestWidgetsFlutterBinding.ensureInitialized();

      final mockGeocodingPlatform = MockGeocodingPlatform();
      GeocodingPlatform.instance = mockGeocodingPlatform;
      GeolocatorPlatform.instance = MockGeoLocatorPlatform();

      final address = getAddressFromLatLng(
        Position(
          longitude: 72.571365,
          latitude: 23.022505,
          timestamp: DateTime.now(),
          accuracy: 81,
          altitude: 100,
          heading: 12,
          speed: 10,
          speedAccuracy: 12,
          altitudeAccuracy: 0.0,
          headingAccuracy: 0.0,
        ),
      );
      isLocationServiceEnabled(MockBuildContext());
      getCurrentPosition(MockBuildContext());
      expect(address.toString().isNotEmpty, true);
    },
  );

  test(
    'handle location disabled',
    () async {
      TestWidgetsFlutterBinding.ensureInitialized();

      final mockGeocodingPlatform = MockGeocodingPlatform();
      GeocodingPlatform.instance = mockGeocodingPlatform;
      GeolocatorPlatform.instance = MockGeoLocatorPlatform(
        isLocationEnabled: false,
      );

      final address = getAddressFromLatLng(
        Position(
          longitude: 72.571365,
          latitude: 23.022505,
          timestamp: DateTime.now(),
          accuracy: 81,
          altitude: 100,
          heading: 12,
          speed: 10,
          speedAccuracy: 12,
          altitudeAccuracy: 0.0,
          headingAccuracy: 0.0,
        ),
      );
      isLocationServiceEnabled(MockBuildContext());
      getCurrentPosition(MockBuildContext());
      expect(address.toString().isNotEmpty, true);
    },
  );

  test(
    'handle location permission denied',
    () async {
      TestWidgetsFlutterBinding.ensureInitialized();

      final mockGeocodingPlatform = MockGeocodingPlatform();
      GeocodingPlatform.instance = mockGeocodingPlatform;
      GeolocatorPlatform.instance = MockGeoLocatorPlatform(
        isLocationEnabled: true,
        locationPermission: LocationPermission.denied,
      );

      final address = getAddressFromLatLng(
        Position(
          longitude: 72.571365,
          latitude: 23.022505,
          timestamp: DateTime.now(),
          accuracy: 81,
          altitude: 100,
          heading: 12,
          speed: 10,
          speedAccuracy: 12,
          altitudeAccuracy: 0.0,
          headingAccuracy: 0.0,
        ),
      );
      isLocationServiceEnabled(MockBuildContext());
      getCurrentPosition(MockBuildContext());
      expect(address.toString().isNotEmpty, true);
    },
  );

  test(
    'handle location permission denied forever',
    () async {
      TestWidgetsFlutterBinding.ensureInitialized();

      final mockGeocodingPlatform = MockGeocodingPlatform();
      GeocodingPlatform.instance = mockGeocodingPlatform;
      GeolocatorPlatform.instance = MockGeoLocatorPlatform(
        locationPermission: LocationPermission.deniedForever,
      );

      final address = getAddressFromLatLng(
        Position(
          longitude: 72.571365,
          latitude: 23.022505,
          timestamp: DateTime.now(),
          accuracy: 81,
          altitude: 100,
          heading: 12,
          speed: 10,
          speedAccuracy: 12,
          altitudeAccuracy: 0.0,
          headingAccuracy: 0.0,
        ),
      );
      isLocationServiceEnabled(MockBuildContext());
      getCurrentPosition(MockBuildContext());
      expect(address.toString().isNotEmpty, true);
    },
  );

  test(
    'handle error in getCurrentPosition',
    () async {
      TestWidgetsFlutterBinding.ensureInitialized();

      final mockGeocodingPlatform = MockGeocodingPlatform();
      GeocodingPlatform.instance = mockGeocodingPlatform;
      GeolocatorPlatform.instance = MockGeoLocatorPlatform(
        throwError: true,
      );

      final currentPosition = await getCurrentPosition(MockBuildContext());

      expect(currentPosition, null);
    },
  );

  test(
    'handle error in getAddressFromLatLng',
    () async {
      TestWidgetsFlutterBinding.ensureInitialized();

      final mockGeocodingPlatform = MockGeocodingPlatform(throwError: true);
      GeocodingPlatform.instance = mockGeocodingPlatform;
      GeolocatorPlatform.instance = MockGeoLocatorPlatform();

      final address = await getAddressFromLatLng(
        Position(
          longitude: 72.571365,
          latitude: 23.022505,
          timestamp: DateTime.now(),
          accuracy: 81,
          altitude: 100,
          heading: 12,
          speed: 10,
          speedAccuracy: 12,
          altitudeAccuracy: 0.0,
          headingAccuracy: 0.0,
        ),
      );

      expect(address, 'Fetching Location...');
    },
  );

  test(
    'getCurrentPosition test',
    () async {
      TestWidgetsFlutterBinding.ensureInitialized();
      mockContext = MockBuildContext();
      final currentPosition = getCurrentPosition(mockContext);
      expect(currentPosition.toString().isNotEmpty, true);
    },
  );
}

class MockBuildContext extends Mock implements BuildContext {}
