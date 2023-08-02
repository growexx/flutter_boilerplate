import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/util/location_utils/location_utils.dart';
import 'package:flutter_boilerplate/view_model/google_map_view_model.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

class GoogleMapFieldWidget extends StatefulWidget {
  final GoogleMapViewModel viewModel;

  const GoogleMapFieldWidget({super.key, required this.viewModel});

  @override
  State<GoogleMapFieldWidget> createState() => _GoogleMapFieldWidgetState();
}

class _GoogleMapFieldWidgetState extends State<GoogleMapFieldWidget> {
  @override
  void initState() {
    super.initState();
    getCurrentPosition(context).then((value) {
      widget.viewModel.setCurrentPosition = value;
    });
  }

  @override
  Widget build(BuildContext context) {

    print("build called");

    final theme = Theme.of(context);
    return Consumer(
      builder: (BuildContext context, value, Widget? child) {
        print("builder called");
        return Center(
            child: defaultTargetPlatform == TargetPlatform.android ||
                    defaultTargetPlatform == TargetPlatform.iOS
                ? widget.viewModel.currentPosition != null
                    ? buildGoogleMap()
                    : const Center(child: CircularProgressIndicator())
                : Center(
                    child: Text("google-map-functionality",
                            textAlign: TextAlign.center,
                            style: theme.textTheme.headlineMedium)
                        .tr(),
                  ));
      },
    );
  }

  Widget buildGoogleMap() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(height: 10),
        widget.viewModel.currentAddress != null
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("your_location").tr(),
                  Text("${widget.viewModel.currentAddress}",
                      maxLines: 1,
                      style: const TextStyle(overflow: TextOverflow.ellipsis))
                ],
              )
            : const SizedBox(height: 0, width: 0),
        const SizedBox(height: 10),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.80,
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
      ],
    );
  }
}
