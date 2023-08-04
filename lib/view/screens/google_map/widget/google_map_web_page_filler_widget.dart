import 'package:flutter/cupertino.dart';
import 'package:flutter_boilerplate/view_model/google_map_view_model.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapWebPageFillerWidget extends StatefulWidget {
  final GoogleMapViewModel viewModel;

  const GoogleMapWebPageFillerWidget({super.key, required this.viewModel});

  @override
  State<GoogleMapWebPageFillerWidget> createState() =>
      _GoogleMapWebPageFillerWidgetState();
}

class _GoogleMapWebPageFillerWidgetState
    extends State<GoogleMapWebPageFillerWidget> {

  @override
  Widget build(BuildContext context) {
    return buildGoogleMap();
  }

  Widget buildGoogleMap() {
    return GoogleMap(
      key:const Key("google_map"),
      mapType: MapType.normal,
      initialCameraPosition: widget.viewModel.kGooglePlex,
      onMapCreated: (GoogleMapController controller) {
        widget.viewModel.controller.complete(controller);
        //moving camera to current location.
        LatLng currentPositionLatLng = LatLng(
            widget.viewModel.latLngForWeb.latitude,
            widget.viewModel.latLngForWeb.longitude);
        controller.animateCamera(CameraUpdate.newCameraPosition(
            CameraPosition(target: currentPositionLatLng, zoom: 14)));
      },
      markers: {
        Marker(
          markerId: const MarkerId('Current Location'),
          position: LatLng(widget.viewModel.latLngForWeb.latitude,
              widget.viewModel.latLngForWeb.longitude),
        )
      }
    );
  }
}
