

import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/app_manager/component/responsive/widget/responsive_helper.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {


  testWidgets('ResponsiveHelper Widget Test', (WidgetTester tester) async {
    // ignore: deprecated_member_use
    tester.binding.window.physicalSizeTestValue = const Size(42, 42);


    Widget widget =  Material(
      child: SizedBox(
        height: 200,
        width: 200,
        child: ResponsiveHelperWidget(
          mobile: Container(),
          desktop: Container(),
        ),
      ),
    );

    await tester.pumpWidget(widget);
    // resets the screen to its original size after the test end
    // ignore: deprecated_member_use
    addTearDown(tester.binding.window.clearPhysicalSizeTestValue);
  });
}