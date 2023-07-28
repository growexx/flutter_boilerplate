
import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/app_manager/extension/is_valid_email.dart';
import 'package:flutter_boilerplate/app_manager/extension/valid_password.dart';

class ValidationHelper {
  static const String requiredFieldText = "This is a mandatory field";

  static String? passwordValidation(String? val) {
    if (val == null || val.trim().isEmpty) {
      return requiredFieldText;
    } else if (!val.isValidPassword()) {
      return "The entered password does not match the password policy.";
    } else {
      return null;
    }
  }

  static String? confirmPasswordValidation(String? val,
      {required String newPassword}) {
    if (val == null || val.trim().isEmpty) {
      return requiredFieldText;
    } else if (newPassword != val) {
      return "The passwords you have entered do not match. Please try again";
    } else {
      return null;
    }
  }

  static String? emailValidation(String? val, {String? errorText}) {
    if (val == null || val.trim().isEmpty) {
      return requiredFieldText;
    } else if (!val.isValidEmail()) {
      return "Please enter a valid email address";
    } else if (errorText != null) {
      return errorText;
    } else {
      return null;
    }
  }

  static String? requiredField(String? val,
      {String? errorText, FocusNode? focusNode}) {
    if (val == null || val.trim().isEmpty) {
      _requestFocus(focusNode);
      return requiredFieldText;
    } else if (errorText != null) {
      _requestFocus(focusNode);
      return errorText;
    } else {
      return null;
    }
  }

  static void _requestFocus(FocusNode? focusNode) {
    if (focusNode != null) {
      focusNode.requestFocus();
    }
  }

}
