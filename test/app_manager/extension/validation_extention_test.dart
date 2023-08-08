


import 'package:flutter_boilerplate/app_manager/extension/is_valid_email.dart';
import 'package:flutter_boilerplate/app_manager/extension/is_valid_mobile.dart';
import 'package:flutter_boilerplate/app_manager/extension/valid_password.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("Validation Extensions", () {
    test("Valid Password Extension Test", () {
      expect("Test@123".isValidPassword(), true);
      expect("Test".isValidPassword(), false);
      expect("".isValidPassword(), false);
    },);

    test("Valid Email Extension Test", () {
      expect("email@mail.com".isValidEmail(), true);
      expect("email".isValidEmail(), false);
      expect("mail.com".isValidEmail(), false);
      expect("".isValidEmail(), false);
    },);

    test("Valid Mobile Extension Test", () {
      expect("+911234567890".isValidMobile(), true);
      expect("1234567890".isValidMobile(), true);
      expect("911234567890".isValidMobile(), false);
      expect("".isValidMobile(), false);
    });
  });
}