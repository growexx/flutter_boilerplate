import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/app_manager/helper/camera_and_images/custom_image_picker.dart';
import 'package:flutter_boilerplate/app_manager/helper/camera_and_images/custom_image_picker_widget.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockBuildContext extends Mock implements BuildContext {}

void main() {
  testWidgets('showCustomImagePicker displays options correctly',
      (WidgetTester tester) async {
    mockOnReceiveFilePath(String? filePath) {}
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
          body: CustomImagePickerWidget(
              onReceiveFilePath: mockOnReceiveFilePath, child: Container())),
    ));
    expect(find.byType(InkWell), findsOneWidget);
    await tester.tap(find.byType(InkWell));
  });
  test(
    "methods testing is done",
    () {
      CustomImagePicker.pickImageFromGallery();
      CustomImagePicker.pickImageFromCamera();
    },
  );
}
