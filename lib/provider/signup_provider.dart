import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:digital_identity_vault/common/utilities.dart';
import 'package:digital_identity_vault/pages/auth.dart/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignupProvider extends ChangeNotifier {
  final fullNameController = TextEditingController();
  final mobileNumberController = TextEditingController();
  final ageController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  bool setLoader(bool value) {
    _isLoading = value;
    notifyListeners();
    return value;
  }

  Future<void> signupUser(BuildContext context) async {
    try {
      setLoader(true);

      final userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );

      final String uid = userCredential.user!.uid;

      await FirebaseFirestore.instance.collection("users").doc(uid).set({
        "uid": uid,
        "fullName": fullNameController.text.trim(),
        "mobile": mobileNumberController.text.trim(),
        "age": ageController.text.trim(),
        "email": emailController.text.trim(),
      });

      log("User created with UID: $uid");

      if (context.mounted) {
        Utilities.navigateTo(context: context, screen: LoginPage());
        Utilities.showSnacbar(context: context, message: "SignUp Successful!");
      }
    } on FirebaseAuthException catch (e) {
      String errorMessage;

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
    } finally {
      setLoader(false);
    }
  }
}
