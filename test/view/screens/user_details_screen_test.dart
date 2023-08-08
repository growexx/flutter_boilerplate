import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/authentication/user.dart';
import 'package:flutter_boilerplate/authentication/user_repository.dart';
import 'package:flutter_boilerplate/view/screens/user_details_screen.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:network_image_mock/network_image_mock.dart';
import 'package:provider/provider.dart';

void main() {
  testWidgets("User detail edit button click test", (widgetTester) async {
    await mockNetworkImagesFor(() async {
      await widgetTester.pumpWidget(
        MultiProvider(
          providers: [
            ChangeNotifierProvider<UserRepository>.value(
                value: UserRepository(
                    currentUser: User(
                        firstName: "John",
                        email: "John@example.com",
                        profileUrl: 'https://example.com'))),
          ],
          child: MaterialApp(
            home: UserDetailsScreen(),
          ),
        ),
      );
    });

    await widgetTester.tap(find.byIcon(Icons.edit));
    await widgetTester.tap(find.byType(GestureDetector).first);
  });
}
