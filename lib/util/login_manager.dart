import 'package:flutter/services.dart';

class LoginManager {
  static bool isValidEmail(String input) {
    final emailRegex = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,6}$');
    return emailRegex.hasMatch(input);
  }

  static bool isValidPassword(String password) {
    final passwordRegex = RegExp(r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$');
    return passwordRegex.hasMatch(password);
  }

  static (bool, String) login(String email, String password) {
    // TODO: Implement login logic here with database.

    if (isValidEmail(email) && isValidPassword(password)) {
      return (true, "Login successful.");
    } else {
      if (!isValidEmail(email)) {
        return (false, "Invalid email. Please enter a valid email address.");
      }
      
      if (!isValidPassword(password)) {
        return (false, "Invalid password. Password must be at least 8 characters long, contain uppercase letters, digits, and special characters.");
      }
    }
    return (false, "Login failed due to unknown reasons.");
  }
}

class EnglishAndEmailTextInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue, TextEditingValue newValue) {
      final newText = newValue.text.replaceAll(RegExp(r'[^\w\s@.-]'), '');
      final selectionIndex = newText.length;
      
      return TextEditingValue(
        text: newText,
        selection: TextSelection.collapsed(offset: selectionIndex),
      );
  }
}