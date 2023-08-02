import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapWebPageFillerWidget extends StatefulWidget {
  const GoogleMapWebPageFillerWidget({super.key});

  @override
  State<GoogleMapWebPageFillerWidget> createState() =>
      _GoogleMapWebPageFillerWidgetState();
}

class _GoogleMapWebPageFillerWidgetState
    extends State<GoogleMapWebPageFillerWidget> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  @override
  Widget build(BuildContext context) {
    return buildGoogleMap();
  }

  Widget buildGoogleMap() {
    return GoogleMap(
      mapType: MapType.normal,
      initialCameraPosition: _kGooglePlex,
      onMapCreated: (GoogleMapController controller) {
        _controller.complete(controller);
      },
      markers: {
        const Marker(
          markerId: MarkerId('Sydney'),
          position: LatLng(-33.86, 151.20),
        )
      },
    );
  }
}
