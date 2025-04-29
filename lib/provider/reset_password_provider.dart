import 'dart:developer';

import 'package:digital_identity_vault/common/utilities.dart';
import 'package:digital_identity_vault/pages/auth.dart/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ResetPasswordProvider extends ChangeNotifier {
  final usercController = TextEditingController();
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  bool setLoader(bool value) {
    _isLoading = value;
    notifyListeners();
    return value;
  }

  Future<void> resetPasswordLink(BuildContext context) async {
    try {
      //
      setLoader(true);
      //
    
          await FirebaseAuth.instance.sendPasswordResetEmail(
        email: usercController.text.trim(),
      );
      //
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => LoginPage(),
        ),
      );
      //
      if (context.mounted) {
        Utilities.showSnacbar(context: context, message: "Password reset link sent to you email!");
      }
      //
    } on FirebaseAuthException catch (e) {
      String? errorMessage;

      switch (e.code) {
        case 'email-already-in-use':
          errorMessage = "This email address is already in use.";
          break;
        case 'invalid-email':
          errorMessage = "The email address is not valid.";
          break;
        default:
          errorMessage = "An unexpected error occurred. Please try again.";
      }

      Utilities.showSnacbar(
          context: context, message: errorMessage, color: Colors.red);
      log(e.toString());
    } finally {
      setLoader(false);
    }
  }
}
