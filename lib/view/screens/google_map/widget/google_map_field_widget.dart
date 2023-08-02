import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/view_model/google_map_view_model.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapFieldWidget extends StatefulWidget {
  final GoogleMapViewModel viewModel;

  const GoogleMapFieldWidget({super.key, required this.viewModel});

  @override
  State<GoogleMapFieldWidget> createState() => _GoogleMapFieldWidgetState();
}

class _GoogleMapFieldWidgetState extends State<GoogleMapFieldWidget> {
  String? _currentAddress;
  Position? _currentPosition;

  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(23.033863, 72.585022),
    zoom: 14,
  );

  @override
  void initState() {
    super.initState();
    _getCurrentPosition();
    //_getAddressFromLatLng(_currentPosition!);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Center(
        child: defaultTargetPlatform == TargetPlatform.android ||
                defaultTargetPlatform == TargetPlatform.iOS
            ? _currentPosition != null
                ? buildGoogleMap()
                : const Center(child: CircularProgressIndicator())
            : Center(
                child: Text("google-map-functionality",
                        textAlign: TextAlign.center,
                        style: theme.textTheme.headlineMedium)
                    .tr(),
              ));
  }

  Widget buildGoogleMap() {
    return GoogleMap(
      mapType: MapType.normal,
      initialCameraPosition: _kGooglePlex,
      onMapCreated: (GoogleMapController controller) {
        _controller.complete(controller);

        //moving camera to current location.
        LatLng currentPositionLatLng = LatLng(_currentPosition!.latitude,_currentPosition!.longitude);
        controller.animateCamera(
            CameraUpdate.newCameraPosition(
                CameraPosition(target: currentPositionLatLng, zoom: 17)
              //17 is new zoom level
            )
        );
      },
      markers: {
        Marker(
          markerId: const MarkerId('Current Location'),
          position: LatLng(
              _currentPosition!.latitude, _currentPosition!.longitude),
        )
      },
    );
  }

  Future<bool> _handleLocationPermission() async {
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

  Future<void> _getCurrentPosition() async {
    final hasPermission = await _handleLocationPermission();
    if (!hasPermission) return;
    await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then((Position position) {
      setState(() => _currentPosition = position);
    }).catchError((e) {
      debugPrint(e);
    });
  }

  Future<void> _getAddressFromLatLng(Position position) async {
    await placemarkFromCoordinates(
            _currentPosition!.latitude, _currentPosition!.longitude)
        .then((List<Placemark> placeMarks) {
      Placemark place = placeMarks[0];
      setState(() {
        _currentAddress =
            "'${place.street}, ${place.subLocality},${place.subAdministrativeArea}, ${place.postalCode}'";
      });
    }).catchError((e) {
      debugPrint(e);
    });
  }
}
