import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/util/location_utils/location_utils.dart';
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
  @override
  void initState() {
    super.initState();
    _getCurrentPosition(context);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
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
                  Text(
                    "${widget.viewModel.currentAddress}",
                    maxLines: 1,
                    style: const TextStyle(overflow: TextOverflow.ellipsis),
                  )
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
              _getAddressFromLatLng(widget.viewModel.currentPosition!);
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

  Future<void> _getCurrentPosition(BuildContext context) async {
    final hasPermission = await handleLocationPermission(context);
    if (!hasPermission) return;
    await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then((Position position) {
      setState(() => widget.viewModel.currentPosition = position);
    }).catchError((e) {
      debugPrint(e);
    });
  }

  Future<void> _getAddressFromLatLng(Position position) async {
    await placemarkFromCoordinates(widget.viewModel.currentPosition!.latitude,
            widget.viewModel.currentPosition!.longitude)
        .then((List<Placemark> placeMarks) {
      Placemark place = placeMarks[0];
      setState(() {
        widget.viewModel.currentAddress =
            "'${place.street}, ${place.subLocality},${place.subAdministrativeArea}, ${place.postalCode}'";
      });
    }).catchError((e) {
      debugPrint(e);
    });
  }
}
