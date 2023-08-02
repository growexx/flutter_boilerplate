import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapViewModel extends ChangeNotifier {
  String? currentAddress="fetching_location".tr();
  Position? currentPosition;

  final Completer<GoogleMapController> controller =
      Completer<GoogleMapController>();

  CameraPosition kGooglePlex = const CameraPosition(
    target: LatLng(23.033863, 72.585022),
    zoom: 14,
  );

  GoogleMapViewModel() {
    //
  }

  set setCurrentPosition(Position? fetchedPosition) {
    currentPosition = fetchedPosition;
    notifyListeners();
  }

  set setCurrentAddress(String? convertedLocation) {
    currentAddress = convertedLocation;
    notifyListeners();
  }
}
