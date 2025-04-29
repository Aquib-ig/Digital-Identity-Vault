import 'dart:developer';
import 'package:digital_identity_vault/common/utilities.dart';
import 'package:digital_identity_vault/pages/app_pages/mian_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginProvider extends ChangeNotifier {
  final userController = TextEditingController();
  final passwordController = TextEditingController();
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  bool setLoader(bool value) {
    _isLoading = value;
    notifyListeners();
    return value;
  }

  Future<void> loginUser(BuildContext context) async {
    //
    try {
      setLoader(true);
      final userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: userController.text.trim(),
        password: passwordController.text.trim(),
      );
      //
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => MainPage()));
      //
      if (!context.mounted) return;
      Utilities.showSnacbar(
        context: context,
        message: "Login Successfull!",
      );
//
      log(userCredential.toString());
    } on FirebaseException catch (e) {
      String? errorMessage;

      switch (e.code) {
        case 'email-already-in-use':
          errorMessage = "This email address is already in use.";
          break;
        case 'invalid-email':
          errorMessage = "The email address is not valid.";
          break;
        case 'operation-not-allowed':
          errorMessage = "Email/password accounts are not enabled.";
          break;
        case 'weak-password':
          errorMessage = "The password is too weak.";
          break;
        default:
          errorMessage = "An unexpected error occurred. Please try again.";
      }

      Utilities.showSnacbar(
          context: context, message: errorMessage, color: Colors.red);
      log(e.toString());
      log(e.toString());
    } finally {
      setLoader(false);
    }
  }
}
