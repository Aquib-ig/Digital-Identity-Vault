import 'package:flutter/material.dart';

class PasswordVisiblityProvider extends ChangeNotifier {
  bool _isObscured = true;
  bool get isObscured => _isObscured;

  void passwordVisiblity() {
    _isObscured = !_isObscured;
    notifyListeners();
  }
}
