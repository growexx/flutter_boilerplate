import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/util/location_utils/location_utils.dart';
import 'package:flutter_boilerplate/view_model/google_map_view_model.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapWidget extends StatefulWidget {
  final GoogleMapViewModel viewModel;

  const GoogleMapWidget({super.key, required this.viewModel});

  @override
  State<GoogleMapWidget> createState() => _GoogleMapWidgetState();
}

class _GoogleMapWidgetState extends State<GoogleMapWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(height: 10),
        widget.viewModel.currentAddress != null
            ? Expanded(
                flex: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("your_location").tr(),
                    Text("${widget.viewModel.currentAddress}",
                        maxLines: 1,
                        style: const TextStyle(overflow: TextOverflow.ellipsis))
                  ],
                ),
              )
            : const SizedBox(height: 0, width: 0),
        const SizedBox(height: 10),
        Expanded(
          flex: 10,
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.75,
            child: GoogleMap(
              mapType: MapType.normal,
              initialCameraPosition: widget.viewModel.kGooglePlex,
              onMapCreated: (GoogleMapController controller) {
                widget.viewModel.controller.complete(controller);

                //moving camera to current location.
                LatLng currentPositionLatLng = LatLng(
                    widget.viewModel.currentPosition!.latitude,
                    widget.viewModel.currentPosition!.longitude);
                controller.animateCamera(CameraUpdate.newCameraPosition(
                    CameraPosition(target: currentPositionLatLng, zoom: 14)));

                //getting current address or location from co-ordinates
                getAddressFromLatLng(widget.viewModel.currentPosition!)
                    .then((value) {
                  widget.viewModel.setCurrentAddress = value;
                });
              },
              markers: {
                Marker(
                  markerId: const MarkerId('Current Location'),
                  position: LatLng(widget.viewModel.currentPosition!.latitude,
                      widget.viewModel.currentPosition!.longitude),
                )
              },
            ),
          ),
        ),
      ],
    );
  }
}
