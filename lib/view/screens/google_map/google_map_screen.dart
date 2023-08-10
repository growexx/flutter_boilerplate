import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/app_manager/component/responsive/widget/responsive_helper.dart';
import 'package:flutter_boilerplate/view/screens/google_map/widget/google_map_field_widget.dart';
import 'package:flutter_boilerplate/view/screens/google_map/widget/google_map_web_page_filler_widget.dart';
import 'package:flutter_boilerplate/view_model/google_map_view_model.dart';
import 'package:provider/provider.dart';

class GoogleMapScreen extends StatefulWidget {
  static const String name = "google_map";
  static const String path = "/$name";

  const GoogleMapScreen({super.key});

  @override
  State<GoogleMapScreen> createState() => _GoogleMapScreenState();
}

class _GoogleMapScreenState extends State<GoogleMapScreen> {
  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<GoogleMapViewModel>(context, listen: false);
    Widget googleMapFieldWidget = GoogleMapFieldWidget(viewModel: viewModel);
    Widget googleMapFieldWidgetForWeb =
        GoogleMapWebPageFillerWidget(viewModel: viewModel);

    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: ResponsiveHelperWidget(
              mobile: googleMapFieldWidget,
              desktop: Row(
                children: [
                  Expanded(flex: 3, child: googleMapFieldWidgetForWeb),
                  Expanded(flex: 1, child: googleMapFieldWidget),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
