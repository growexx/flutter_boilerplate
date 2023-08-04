import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/util/location_utils/location_utils.dart';
import 'package:flutter_boilerplate/view/screens/google_map/widget/google_map_widget.dart';
import 'package:flutter_boilerplate/view_model/google_map_view_model.dart';
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
    final theme = Theme.of(context);
    return Consumer<GoogleMapViewModel>(
      builder: (BuildContext context, value, Widget? child) {
        return Center(
            child: defaultTargetPlatform == TargetPlatform.android ||
                    defaultTargetPlatform == TargetPlatform.iOS
                ? widget.viewModel.currentPosition != null
                    ? GoogleMapWidget(
                        key: const Key("google_map_widget"),
                        viewModel: widget.viewModel)
                    : const Center(
                        key: Key("center"),
                        child: CircularProgressIndicator(
                          key: Key("cp_indicator"),
                        ))
                : Center(
                    child: Text(
                            key: const Key("text_map_functionality"),
                            "google-map-functionality",
                            textAlign: TextAlign.center,
                            style: theme.textTheme.headlineMedium)
                        .tr(),
                  ));
      },
    );
  }
}
