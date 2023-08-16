


import 'dart:ui';

import 'package:flutter_boilerplate/app_manager/extension/color_extention.dart';
import 'package:flutter_boilerplate/app_manager/theme/app_color.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test("AppColor Test", () {
    // ignore: unnecessary_type_check
    expect(AppColor.secondary is Color, true);
    // ignore: unnecessary_type_check
    expect(AppColor.white is Color, true);
    // ignore: unnecessary_type_check
    expect(AppColor.grey0 is Color, true);
    // ignore: unnecessary_type_check
    expect(AppColor.grey is Color, true);
    // ignore: unnecessary_type_check
    expect(AppColor.grey5 is Color, true);
    // ignore: unnecessary_type_check
    expect(AppColor.scaffoldBackgroundColor is Color, true);
    // ignore: unnecessary_type_check
    expect(AppColor.grey1 is Color, true);
    // ignore: unnecessary_type_check
    expect(AppColor.grey3 is Color, true);
    // ignore: unnecessary_type_check
    expect(AppColor.grey4 is Color, true);
    // ignore: unnecessary_type_check
    expect(AppColor.grey6 is Color, true);
    // ignore: unnecessary_type_check
    expect(AppColor.grey7 is Color, true);
    // ignore: unnecessary_type_check
    expect(AppColor.grey8 is Color, true);
    // ignore: unnecessary_type_check
    expect(AppColor.greyDark is Color, true);
    // ignore: unnecessary_type_check
    expect(AppColor.hintColor is Color, true);
    // ignore: unnecessary_type_check
    expect(AppColor.hintColorForDarkTheme is Color, true);
    // ignore: unnecessary_type_check
    expect(AppColor.error is Color, true);
    // ignore: unnecessary_type_check
    expect(lighten(AppColor.error) is Color, true);
    // ignore: unnecessary_type_check
    expect(darken(AppColor.error) is Color, true);

  },);
}