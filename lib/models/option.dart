
import 'package:flutter/foundation.dart';

class Option<T> {
  Key? key;
  String? title;
  String? value;
  String? imagePath;
  bool? boolValue;
  VoidCallback? onTap;
  T? extra;

  Option({this.key, this.title, this.value, this.extra, this.imagePath, this.onTap, this.boolValue=true});

  Option.fromJson(Map<String, dynamic> json) {
    key = json['key'];
    title = json['title'];
    value = json['value'];
    extra = json['extra'];
    imagePath = json['imagePath'];
    onTap = json['onTap'];
    boolValue = json['boolValue'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['key'] = key;
    data['title'] = title;
    data['value'] = value;
    data['extra'] = extra;
    data['onTap'] = onTap;
    data['boolValue'] = boolValue;
    return data;
  }
}
