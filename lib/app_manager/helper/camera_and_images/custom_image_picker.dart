import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter_boilerplate/app_manager/service/navigation_service.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class CustomImagePicker {
  static Future<String?> pickImageFromGallery({bool cropImage = true}) async {
    try {
      final image = await ImagePicker().pickImage(
        source: ImageSource.gallery,
      );
      if (cropImage) {
        var crop = await _cropImage(image!.path);
        return crop?.path;
      } else {
        return image?.path;
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
    return null;
  }

  static Future<CroppedFile?> _cropImage(filePath) async {
    CroppedFile? croppedImage = await ImageCropper().cropImage(
      sourcePath: filePath,
      maxWidth: 1080,
      maxHeight: 1080,
      uiSettings: [
        WebUiSettings(
          context: NavigationService.context!,
        ),
      ],
    );
    return croppedImage;
  }

  static Future<String?> pickImageFromCamera({bool cropImage = true}) async {
    try {
      var image = await ImagePicker().pickImage(source: ImageSource.camera);
      if (cropImage) {
        var crop = await _cropImage(image!.path);
        return crop?.path;
      } else {
        return image?.path;
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
    return null;
  }

  static getPicInBase64(pics) async {
    var str = await pics.path;
    var converted = (base64.encode(await File(str).readAsBytes()));
    return converted;
  }
}
