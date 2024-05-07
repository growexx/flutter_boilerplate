import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_boilerplate/app_manager/helper/camera_and_images/custom_image_picker.dart';
import 'package:flutter_boilerplate/app_manager/helper/camera_and_images/custom_image_picker_widget.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:mockito/mockito.dart';

// ignore: depend_on_referenced_packages
import 'package:image_picker_platform_interface/image_picker_platform_interface.dart';
// ignore: depend_on_referenced_packages
import 'package:image_cropper_platform_interface/image_cropper_platform_interface.dart';

import '../../../util/testing_material_app.dart';

class MockBuildContext extends Mock implements BuildContext {}

class MockFile extends Mock implements File {
  @override
  Future<File> writeAsBytes(
    List<int> bytes, {
    FileMode mode = FileMode.write,
    bool flush = false,
  }) async {
    return File('assets/png/error.png');
  }

  @override
  String get path => 'assets/png/error.png';
}

class FakeImagePicker extends ImagePickerPlatform {
  final File file;
  FakeImagePicker(this.file);

  @override
  Future<XFile?> getImageFromSource({
    required ImageSource source,
    ImagePickerOptions options = const ImagePickerOptions(),
  }) async {
    final ByteData data = await rootBundle.load('assets/png/error.png');
    final Uint8List bytes = data.buffer.asUint8List();
    final res = await file.writeAsBytes(bytes);
    return XFile(res.path);
  }
}

class MockImageCropper extends ImageCropperPlatform {
  @override
  Future<CroppedFile?> cropImage({
    required String sourcePath,
    int? maxWidth,
    int? maxHeight,
    CropAspectRatio? aspectRatio,
    List<CropAspectRatioPreset> aspectRatioPresets = const [
      CropAspectRatioPreset.original,
      CropAspectRatioPreset.square,
      CropAspectRatioPreset.ratio3x2,
      CropAspectRatioPreset.ratio4x3,
      CropAspectRatioPreset.ratio16x9,
    ],
    CropStyle cropStyle = CropStyle.rectangle,
    ImageCompressFormat compressFormat = ImageCompressFormat.jpg,
    int compressQuality = 90,
    List<PlatformUiSettings>? uiSettings,
  }) async {
    return CroppedFile(sourcePath);
  }
}

void main() {
  setUp(
    () => {
      ImagePickerPlatform.instance = FakeImagePicker(MockFile()),
      ImageCropperPlatform.instance = MockImageCropper(),
    },
  );

  testWidgets('showCustomImagePicker displays options correctly',
      (WidgetTester tester) async {
    TestWidgetsFlutterBinding.ensureInitialized();
    mockOnReceiveFilePath(String? filePath) {}
    await tester.pumpWidget(
      testingMaterial(
        routesData: [
          GoRoute(
            path: '/',
            builder: (context, state) => MaterialApp(
              home: Scaffold(
                body: GestureDetector(
                  key: const Key('main_picker'),
                  onTap: () => context.pushNamed('custom_image_picker_widget'),
                  child: const Text('Click me'),
                ),
              ),
            ),
          ),
          GoRoute(
            path: '/custom_image_picker_widget',
            name: 'custom_image_picker_widget',
            builder: (context, state) => MaterialApp(
              home: Scaffold(
                body: CustomImagePickerWidget(
                  onReceiveFilePath: mockOnReceiveFilePath,
                  child: Container(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const Key('main_picker')));
    await tester.pumpAndSettle();

    expect(find.byType(InkWell), findsOneWidget);
    await tester.tap(find.byType(InkWell));
    await tester.pumpAndSettle();

    expect(find.byKey(const Key('gallery')), findsOneWidget);
    await tester.tap(find.byKey(const Key('gallery')));

    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const Key('main_picker')));
    await tester.pumpAndSettle();

    expect(find.byType(InkWell), findsOneWidget);
    await tester.tap(find.byType(InkWell));
    await tester.pumpAndSettle();

    expect(find.byKey(const Key('camera')), findsOneWidget);
    await tester.tap(find.byKey(const Key('camera')));

    await tester.pumpAndSettle();
  });

  test(
    'methods testing is done',
    () {
      CustomImagePicker.pickImageFromGallery(cropImage: false);
      CustomImagePicker.pickImageFromCamera(cropImage: false);
    },
  );

  test(
    'handle error in picking image',
    () {
      CustomImagePicker.pickImageFromGallery();
      CustomImagePicker.pickImageFromCamera();
    },
  );

  test('Handle getPicInBase64', () async {
    final base64String = await CustomImagePicker.getPicInBase64(MockFile());
    expect(base64String, isA<String>());
  });
}
