

import 'package:flutter/cupertino.dart';
import 'package:flutter_boilerplate/app_manager/component/responsive/responsive.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';

import '../../../util/create_context.dart';
import 'responsive_test.mocks.dart';



@GenerateMocks([BuildContext])


void main() {

  late BuildContext context;

  setUp(() {
    context = createContext(MockBuildContext());
  });


  test("Responsive Test", () {
    // ignore: unnecessary_type_check
    expect(Responsive.widthPercent(context,percentage: 20) is double, true);
    // ignore: unnecessary_type_check
    expect(Responsive.heightPercent(context,percentage: 20) is double, true);
    expect(Responsive.isSmallScreen(context), true);
    expect(Responsive.isSmallHeight(context), true);
  },);
}