
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/app_manager/component/bottom_sheet/custom_bottom_sheet.dart';
import 'package:flutter_boilerplate/app_manager/helper/camera_and_images/custom_image_picker.dart';
import 'package:flutter_boilerplate/app_manager/helper/camera_and_images/selection_box.dart';
import 'package:go_router/go_router.dart';
import '../../component/bottom_sheet/titled_sheet.dart';





class CustomImagePickerWidget extends StatelessWidget {

  final Widget child;
  final ValueChanged<String?> onReceiveFilePath;

  const CustomImagePickerWidget({Key? key,
    required this.child,
    required this.onReceiveFilePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
        key: const Key('main_picker'),
          onTap: (){
            showCustomImagePicker(context, onReceiveFilePath: onReceiveFilePath);
        }, child: child),
    );
  }
}


void showCustomImagePicker(BuildContext context,{
  required ValueChanged<String?> onReceiveFilePath
}) {
  
  List<Widget> widgets = [
  ];
  
  if(!kIsWeb){
    widgets.add(    InkWell(
      key: const Key("camera"),
      onTap: () async{
        context.pop();
        String? filePath= await CustomImagePicker.pickImageFromCamera();
        onReceiveFilePath(filePath);
      },
      child:  const SelectionBox(
        title: "Camera",
        iconData: Icons.camera_alt,
        description: "Click image using camera",
      ),
    ),);
    
  }
  
  widgets.add( InkWell(
    key: const Key("gallery"),
    onTap: () async{
      context.pop();
      String? filePath= await CustomImagePicker.pickImageFromGallery();
      onReceiveFilePath(filePath);
    },
    child:  const SelectionBox(
      title: "Gallery",
      iconData: Icons.image,
      description: "Pick image from gallery",

    ),
  ),);
  
  CustomBottomSheet.open(context,
      child: TitledSheet(title: "Choose Image", child:
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: widgets,
      )
      ));
}
