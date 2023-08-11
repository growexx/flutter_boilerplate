import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_boilerplate/app_manager/component/bottom_sheet/titled_sheet.dart';

void main() {
  testWidgets('TitledSheet displays title and subtitle correctly', (WidgetTester tester) async {
    const title = 'Test Title';
    const subTitle = 'Test Subtitle';
    
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: TitledSheet(
            title: title,
            subTitle: subTitle,
            child: Container(),
          ),
        ),
      ),
    );

    expect(find.text(title), findsOneWidget);
    expect(find.text(subTitle), findsOneWidget);
  });

  testWidgets('TitledSheet displays child widget', (WidgetTester tester) async {
    final child = Container();

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: TitledSheet(
            title: 'Test Title',
            child: child,
          ),
        ),
      ),
    );

    expect(find.byWidget(child), findsOneWidget);
  });


}
