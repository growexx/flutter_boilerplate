import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/app_manager/helper/show_toast.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

  Future<bool> handleLocationPermission(BuildContext context) async {
    LocationPermission permission;

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        showToast("location_permission_denied".tr());
        return false;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      showToast("location_permission_permanently_denied".tr());
      return false;
    }
    return true;
  }

  Future<bool> isLocationServiceEnabled(BuildContext context) async {
    bool serviceEnabled;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      showToast("location_services_are_disabled".tr());
    }
    return serviceEnabled;
  }

  Future<Position?> getCurrentPosition(BuildContext context) async {
    Position? currentPosition;
    final hasPermission = await handleLocationPermission(context);
    if (!hasPermission) return null;
    await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then((Position position) {
      currentPosition = position;
    }).catchError((e) {
      debugPrint(e);
    });
    return currentPosition;
  }

  Future<String> getAddressFromLatLng(Position position) async {
    String currentAddress = "Fetching Location...";
    await placemarkFromCoordinates(position.latitude, position.longitude)
        .then((List<Placemark> placeMarks) {
      Placemark place = placeMarks[0];
      currentAddress =
      "'${place.street}, ${place.subLocality},${place.subAdministrativeArea}, ${place.postalCode}'";
    }).catchError((e) {
      debugPrint(e);
    });
    return currentAddress;
  }


