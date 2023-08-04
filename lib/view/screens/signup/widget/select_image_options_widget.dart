import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 're_usable_select_photo_button.dart';

class SelectImageOptionsScreen extends StatelessWidget {
  final Function(ImageSource source) onTap;
  const SelectImageOptionsScreen({
    Key? key,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.grey.shade300,
      padding: const EdgeInsets.all(20),
      child: Stack(
        alignment: AlignmentDirectional.topCenter,
        clipBehavior: Clip.none,
        children: [
          Positioned(
            top: -35,
            child: Container(
              key:const Key("key_container"),
              width: 50,
              height: 6,
              margin: const EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(2.5),
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Column(children: [
            SelectPhoto(
              key:const Key("key_browse_gallery"),
              onTap: () => onTap(ImageSource.gallery),
              icon: Icons.image,
              textLabel: 'browse_gallery'.tr(),
            ),
            const SizedBox(
              height: 10,
            ),
            Center(
              key:const Key("key_or"),
              child: const Text(
                'or_capital',
                style: TextStyle(fontSize: 18),
              ).tr(),
            ),
            const SizedBox(
              height: 10,
            ),
            SelectPhoto(
              key:const Key("key_use_a_camera"),
              onTap: () => onTap(ImageSource.camera),
              icon: Icons.camera_alt_outlined,
              textLabel: 'use_a_camera'.tr(),
            ),
          ])
        ],
      ),
    );
  }
}
