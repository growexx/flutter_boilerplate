import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/app_manager/helper/validation_helper.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('ValidationHelper', () {
    group('passwordValidation', () {
      test('valid password should return null', () {
        final result = ValidationHelper.passwordValidation('Abc123!');
        expect(result, "The entered password does not match the password policy.");
      });

      test('empty password should return requiredFieldText', () {
        final result = ValidationHelper.passwordValidation('');
        expect(result, equals(ValidationHelper.requiredFieldText));
      });

      test('invalid password should return error message', () {
        final result = ValidationHelper.passwordValidation('weakpassword');
        expect(result, equals('The entered password does not match the password policy.'));
      });
    });

    group('confirmPasswordValidation', () {
      const newPassword = 'Abc123!';

      test('matching password and confirmPassword should return null', () {
        final result = ValidationHelper.confirmPasswordValidation(newPassword, newPassword: newPassword);
        expect(result, isNull);
      });

      test('non-matching password and confirmPassword should return error message', () {
        final result = ValidationHelper.confirmPasswordValidation('Abc123!', newPassword: 'Password123');
        expect(result, equals('The passwords you have entered do not match. Please try again'));
      });

      test('empty confirmPassword should return requiredFieldText', () {
        final result = ValidationHelper.confirmPasswordValidation('', newPassword: newPassword);
        expect(result, equals(ValidationHelper.requiredFieldText));
      });
    });

    group('emailValidation', () {
      test('valid email should return null', () {
        final result = ValidationHelper.emailValidation('test@example.com');
        expect(result, isNull);
      });

      test('empty email should return requiredFieldText', () {
        final result = ValidationHelper.emailValidation('');
        expect(result, equals(ValidationHelper.requiredFieldText));
      });

      test('invalid email should return error message', () {
        final result = ValidationHelper.emailValidation('invalidemail');
        expect(result, equals('Please enter a valid email address'));
      });

      test('valid email with custom error text should return custom error text', () {
        final result = ValidationHelper.emailValidation('test@example.com', errorText: 'Custom error');
        expect(result, equals('Custom error'));
      });
    });

    group('requiredField', () {
      final focusNode = FocusNode();

      test('non-empty value should return null', () {
        final result = ValidationHelper.requiredField('Test');
        expect(result, isNull);
      });

      test('empty value should return requiredFieldText', () {
        final result = ValidationHelper.requiredField('');
        expect(result, equals(ValidationHelper.requiredFieldText));
      });

      test('non-empty value with custom error text should return custom error text', () {
        final result = ValidationHelper.requiredField('Test', errorText: 'Custom error');
        expect(result, equals('Custom error'));
      });

      test('empty value should request focus on the given FocusNode', () {
        ValidationHelper.requiredField('', focusNode: focusNode);
        expect(focusNode.hasFocus, isFalse);
      });
    });
  });
}
