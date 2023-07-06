import 'package:example_app/utils/email_validator.dart';
import 'package:flutter/widgets.dart';

class Validators {
  Validators._();

  static String? emailValidator(String? text, BuildContext _) {
    if (text == null || text.isEmpty) {
      return 'Email is not allowed to be empty';
    }

    final trimmedText = text.trim();
    if (!EmailValidator.validate(trimmedText)) {
      return 'Email must be a valid';
    }

    return null;
  }

  static String? passwordValidator(String? text, BuildContext _) {
    final trimmedText = text?.trim();
    if (trimmedText == null || trimmedText.isEmpty) {
      return 'Password is not allowed to be empty';
    } else if (trimmedText.length < 8 || trimmedText.length > 50) {
      return 'Password must be from 8 to 50 symbols';
    } else if (!trimmedText.contains(RegExp('[a-zA-Z]')) ||
        !trimmedText.contains(RegExp('[0-9]'))) {
      return 'Password should contain at least one letter and one digit';
    }

    return null;
  }
}
