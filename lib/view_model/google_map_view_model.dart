import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapViewModel extends ChangeNotifier {

  String? currentAddress;
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
}
