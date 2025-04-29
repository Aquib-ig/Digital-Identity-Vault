import 'package:digital_identity_vault/pages/app_pages/mian_page.dart';
import 'package:digital_identity_vault/pages/auth.dart/login_page.dart';
import 'package:digital_identity_vault/pages/auth.dart/signup_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return MainPage();
        } else {
          return SignupPage();
        }
      },
    );
  }
}
