/*
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapWidget extends StatefulWidget {
  const GoogleMapWidget({super.key});

  @override
  State<GoogleMapWidget> createState() => _GoogleMapWidgetState();
}

class _GoogleMapWidgetState extends State<GoogleMapWidget> {

  final Completer<GoogleMapController> _controller =
  Completer<GoogleMapController>();

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(23.033863, 72.585022),
    zoom: 14,
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(height: 10),
        _currentAddress != null
            ? Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("your_location").tr(),
            Text(
              "$_currentAddress",
              maxLines: 1,
              style: const TextStyle(overflow: TextOverflow.ellipsis),
            )
          ],
        )
            : const SizedBox(height: 0, width: 0),
        const SizedBox(height: 10),
        GoogleMap(
          mapType: MapType.normal,
          initialCameraPosition: _kGooglePlex,
          onMapCreated: (GoogleMapController controller) {
            _controller.complete(controller);

            //moving camera to current location.
            LatLng currentPositionLatLng =
            LatLng(_currentPosition!.latitude, _currentPosition!.longitude);
            controller.animateCamera(CameraUpdate.newCameraPosition(
                CameraPosition(target: currentPositionLatLng, zoom: 14)));
            getAddressFromLatLng(_currentPosition!);
          },
          markers: {
            Marker(
              markerId: const MarkerId('Current Location'),
              position: LatLng(
                  _currentPosition!.latitude, _currentPosition!.longitude),
            )
          },
        ),
      ],
    );
  }
}
*/
