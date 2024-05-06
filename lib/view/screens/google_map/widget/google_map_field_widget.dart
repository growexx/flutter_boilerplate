import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/app_manager/helper/navigation/navigation_helper.dart';
import 'package:flutter_boilerplate/util/location_utils/location_utils.dart';
import 'package:flutter_boilerplate/view/screens/dashboard/dashboard_screen.dart';
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
    isLocationServiceEnabled().then((value) {
      widget.viewModel.setLocationServiceStatus = value??false;
      if (value??false) {
        getCurrentPosition().then((value) {
          widget.viewModel.setCurrentPosition = value;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<GoogleMapViewModel>(
      builder: (BuildContext context, value, Widget? child) {
        return Center(
            child: widget.viewModel.currentPosition != null
                ? GoogleMapWidget(
                    key: const Key("google_map_widget"),
                    viewModel: widget.viewModel)
                : widget.viewModel.isLocationServiceEnabled
                    ? const Center(
                        key: Key("center"),
                        child: CircularProgressIndicator(
                          key: Key("cp_indicator"),
                        ))
                    : AlertDialog(
                        title: const Text("enable_location").tr(),
                        content: const Text(
                            "enable_location_description").tr(),
                        actions: <Widget>[
                          TextButton(
                            child: const Text('close').tr(),
                            onPressed: () {
                              //Navigator.pop(context);
                              NavigationHelper.pushNamed(
                                  context, DashboardScreen.name);
                            },
                          ),
                        ],
                      ));
      },
    );
  }
}
