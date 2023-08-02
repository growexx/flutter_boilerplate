import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

Future<bool> handleLocationPermission(BuildContext context) async {
  bool serviceEnabled;
  LocationPermission permission;

  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text(
            'Location services are disabled. Please enable the services')));
    return false;
  }
  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Location permissions are denied')));
      return false;
    }
  }
  if (permission == LocationPermission.deniedForever) {
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text(
            'Location permissions are permanently denied, we cannot request permissions.')));
    return false;
  }
  return true;
}

Future<String> _getAddressFromLatLng(Position position) async {
  String currentAddress="Fetching Location...";
  await placemarkFromCoordinates(
      position.latitude, position.longitude)
      .then((List<Placemark> placeMarks) {
    Placemark place = placeMarks[0];
      currentAddress =
      "'${place.street}, ${place.subLocality},${place.subAdministrativeArea}, ${place.postalCode}'";
  }).catchError((e) {
    debugPrint(e);
  });
  return currentAddress;
}