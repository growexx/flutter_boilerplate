
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/app_manager/extension/is_valid_email.dart';
import 'package:flutter_boilerplate/app_manager/extension/is_valid_mobile.dart';
import 'package:flutter_boilerplate/app_manager/extension/valid_name.dart';
import 'package:flutter_boilerplate/app_manager/extension/valid_password.dart';

class ValidationHelper {
  static String requiredFieldText = "mandatory_field";

  static String? nameValidation(String? val) {
    if (val == null || val.trim().isEmpty) {
      return requiredFieldText.tr();
    } else if (!val.isValidName()) {
      return "error_valid_name".tr();
    } else {
      return null;
    }
  }

  static String? passwordValidation(String? val) {
    if (val == null || val.trim().isEmpty) {
      return requiredFieldText.tr();
    } else if (!val.isValidPassword()) {
      return "error_password_policy".tr();
    } else {
      return null;
    }
  }

  static String? confirmPasswordValidation(String? val,
      {required String newPassword}) {
    if (val == null || val.trim().isEmpty) {
      return requiredFieldText.tr();
    } else if (newPassword != val) {
      return "error_confirm_password".tr();
    } else {
      return null;
    }
  }

  static String? emailValidation(String? val, {String? errorText}) {
    if (val == null || val.trim().isEmpty) {
      return requiredFieldText.tr();
    } else if (!val.isValidEmail()) {
      return "error_valid_email_address".tr();
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
      return requiredFieldText.tr();
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

  static String? mobileValidation(String? val, {String? errorText}) {
    if (val == null || val.trim().isEmpty) {
      return requiredFieldText.tr();
    } else if (!val.isValidMobile()) {
      return "error_valid_mobile_number".tr();
    } else if (errorText != null) {
      return errorText;
    } else {
      return null;
    }
  }

}
