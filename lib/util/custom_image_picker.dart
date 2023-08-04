import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class CustomImagePicker {
  static Future pickImageFromGallery({bool? cropImage}) async {
    try {
      final image = await ImagePicker().pickImage(
        source: ImageSource.gallery,
      );

      if (cropImage ?? true) {
        var crop = await _cropImage(image!.path);
        return crop;
      } else {
        return image;
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  static _cropImage(filePath) async {
    CroppedFile? croppedImage = await ImageCropper().cropImage(
      sourcePath: filePath,
      maxWidth: 1080,
      maxHeight: 1080,
    );
    return croppedImage;
  }

  static Future pickImageFromCamera({bool? cropImage}) async {
    try {
      var image = await ImagePicker().pickImage(source: ImageSource.camera);
      if (cropImage ?? true) {
        var crop = await _cropImage(image!.path);
        return crop;
      } else {
        return image;
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  static getPicInBase64(pics) async {
    var str = await pics.path;
    var converted = (base64.encode(await File(str).readAsBytes()));
    return converted;
  }

  static Future getVideo() async {
    try {
      final video = await ImagePicker().pickVideo(source: ImageSource.camera);
      return video;
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  static Future getVideoFromGallery() async {
    try {
      final video = await ImagePicker().pickVideo(source: ImageSource.gallery);
      return video;
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }
}
