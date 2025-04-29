import 'package:digital_identity_vault/firebase_options.dart';
import 'package:digital_identity_vault/pages/splash/splash_screen.dart';
import 'package:digital_identity_vault/provider/bottom_sheet_provider.dart';
import 'package:digital_identity_vault/provider/custom_image_provider.dart';
import 'package:digital_identity_vault/provider/login_provider.dart';
import 'package:digital_identity_vault/provider/password_visiblity_provider.dart';
import 'package:digital_identity_vault/provider/reset_password_provider.dart';
import 'package:digital_identity_vault/provider/signup_provider.dart';
import 'package:digital_identity_vault/provider/theme_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => LoginProvider()),
        ChangeNotifierProvider(create: (context) => SignupProvider()),
        ChangeNotifierProvider(create: (context) => ResetPasswordProvider()),
        ChangeNotifierProvider(
            create: (context) => PasswordVisiblityProvider()),
        ChangeNotifierProvider(create: (context) => BottomSheetProvider()),
        ChangeNotifierProvider(create: (context) => CustomImageProvider()),
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
      ],
      child: const MyApp(), // Now MyApp has access to providers
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeProvider>(context); // Now it works
    return MaterialApp(
      title: "Digital Identity vault",
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(), // Light theme
      darkTheme: ThemeData.dark(), // Dark theme
      themeMode: themeProvider.themeMode, // Apply selected theme mode
      home:
          // StreamBuilder(
          //     stream: FirebaseAuth.instance.authStateChanges(),
          //     builder: (context, snapshot) {
          //       if (snapshot.connectionState == ConnectionState.waiting) {
          //         return Center(
          //           child: CircularProgressIndicator(),
          //         );
          //       }
          //       if (snapshot.data != null) {
          //         return HomePage();
          //       }
          SplashScreen(),
      // }),
    );
  }
}
