import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/util/location_utils/location_utils.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:geolocator/geolocator.dart';

void main() {
  /*test('requestPermission', () async {

    final permission = await LocationUtils().handleLocationPermission(context);
    expect(permission, LocationPermission.whileInUse);
  });
  getCurrentPosition(context);
  getAddressFromLatLng(position);*/
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
      expect(address.toString().isNotEmpty, true);
    },
  );
}
