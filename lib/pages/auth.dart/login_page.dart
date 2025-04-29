import 'package:digital_identity_vault/pages/auth.dart/resetpassword_page.dart';
import 'package:digital_identity_vault/pages/auth.dart/signup_page.dart';
import 'package:digital_identity_vault/provider/login_provider.dart';
import 'package:digital_identity_vault/provider/password_visiblity_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late PasswordVisiblityProvider passwordVisiblityProvider;
  @override
  Widget build(BuildContext context) {
    passwordVisiblityProvider = Provider.of<PasswordVisiblityProvider>(context);
    return Scaffold(
      body: Consumer<LoginProvider>(
        builder: (context, loginProvider, child) => SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  const Spacer(),
                  const Text(
                    "Hello, Welcome Back!",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "Login to continue",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextField(
                    controller: loginProvider.userController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.5),
                      hintText: "Username",
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextField(
                    obscureText: passwordVisiblityProvider.isObscured,
                    controller: loginProvider.passwordController,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        filled: true,
                        fillColor: Colors.white.withOpacity(0.5),
                        hintText: "Password",
                        suffixIcon: IconButton(
                          onPressed: () {
                            passwordVisiblityProvider.passwordVisiblity();
                          },
                          icon: Icon(
                            passwordVisiblityProvider.isObscured
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
                        )),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ResetpasswordPage(),
                          ),
                        );
                      },
                      style: TextButton.styleFrom(),
                      child: const Text("Forgot Password?"),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: loginProvider.isLoading
                          ? null
                          : () async {
                              await loginProvider.loginUser(context);
                            },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.amber,
                        foregroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      child: loginProvider.isLoading
                          ? SizedBox(
                              height: 20,
                              width: 20,
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                              ),
                            )
                          : Text("Login"),
                    ),
                  ),
                  const Spacer(),
                  // const Text(
                  //   "Or you can login with",
                  //   style: TextStyle(
                  //     fontSize: 15,
                  //   ),
                  // ),
                  // const SizedBox(
                  //   height: 20,
                  // ),
                  // ElevatedButton(
                  //   onPressed: () {},
                  //   style: ElevatedButton.styleFrom(
                  //     foregroundColor: Colors.black,
                  //     backgroundColor: Colors.amber,
                  //   ),
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.center,
                  //     children: [
                  //       Image.asset(
                  //         "assets/images/google.png",
                  //         height: 30,
                  //         width: 30,
                  //       ),
                  //       const Text("Login with google"),
                  //     ],
                  //   ),
                  // ),
                  // const SizedBox(
                  //   height: 15,
                  // ),
                  // ElevatedButton(
                  //   onPressed: () {},
                  //   style: ElevatedButton.styleFrom(
                  //     foregroundColor: Colors.black,
                  //     backgroundColor: Colors.amber,
                  //   ),
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.center,
                  //     children: [
                  //       Image.asset(
                  //         "assets/images/facebook.png",
                  //         height: 30,
                  //         width: 30,
                  //       ),
                  //       const Text("Login with facebook"),
                  //     ],
                  //   ),
                  // ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Dont have an account?",
                        style: TextStyle(),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SignupPage(),
                            ),
                          );
                        },
                        style: TextButton.styleFrom(
                          foregroundColor: Colors.amber,
                        ),
                        child: const Text(
                          "Sign up",
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
