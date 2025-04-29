import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:digital_identity_vault/provider/theme_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  final user = FirebaseAuth.instance.currentUser!;
  String? fullName;
  @override
  void initState() {
    super.initState();
    getUserData();
  }

  void getUserData() async {
    final userData = await FirebaseFirestore.instance
        .collection("users")
        .doc(user.uid)
        .get();

    if (userData.exists) {
      setState(() {
        fullName = userData["fullName"];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      appBar: AppBar(title: const Text("Settings")),
      body: ListView(
        children: [
          ListTile(
            leading: const CircleAvatar(
              radius: 34,
            ),
            title: Text(fullName ?? "Loading..."),
            subtitle: Text(user.email ?? "No Email"),
          ),
          const Divider(),

          // Theme Mode
          SwitchListTile(
            title: const Text("Dark Mode"),
            value: themeProvider.themeMode == ThemeMode.dark,
            onChanged: (value) {
              themeProvider.toggleTheme();
            },
          ),

          // Language Selection
          ListTile(
            title: const Text("Language"),
            subtitle: const Text("Select your preferred language"),
            trailing: DropdownButton(
              value: "English",
              items: ["English", "Hindi", "Marathi"].map((String lang) {
                return DropdownMenuItem<String>(
                  value: lang,
                  child: Text(lang),
                );
              }).toList(),
              onChanged: (String? newLang) {},
            ),
          ),

          // Biometric Authentication
          SwitchListTile(
            title: const Text("Biometric Authentication"),
            subtitle: const Text("Use fingerprint or face unlock"),
            value: true,
            onChanged: (bool value) {},
          ),

          // App Lock (PIN/Passcode)
          ListTile(
            title: const Text("App Lock"),
            subtitle: const Text("Enable PIN or passcode"),
            trailing: Switch(
              value: false,
              onChanged: (bool value) {},
            ),
          ),

          // Backup & Restore
          ListTile(
            title: const Text("Backup & Restore"),
            subtitle: const Text("Save and restore your identity data"),
            trailing: const Icon(
              Icons.backup,
              size: 34,
            ),
            onTap: () {},
          ),

          // Notification Settings
          SwitchListTile(
            title: const Text("Enable Notifications"),
            subtitle: const Text("Receive alerts and reminders"),
            value: true,
            onChanged: (bool value) {},
          ),

          // Privacy Policy & Terms
          ListTile(
            title: const Text("Privacy Policy"),
            onTap: () {},
          ),
          ListTile(
            title: const Text("Terms & Conditions"),
            onTap: () {},
          ),

          // Help & Support
          ListTile(
            title: const Text("Help & Support"),
            subtitle: const Text("FAQs & Contact Support"),
            trailing: const Icon(Icons.help_outline),
            onTap: () {},
          ),

          // About App
          ListTile(
            title: const Text("About App"),
            subtitle: const Text("Version 1.0.0"),
            trailing: const Icon(Icons.info_outline),
            onTap: () {},
          ),

          // Delete Account
          ListTile(
            title: const Text("Delete Account"),
            subtitle: const Text("Permanently remove your account"),
            leading: const Icon(Icons.delete_forever, color: Colors.red),
            onTap: () {},
          ),

          // Logout
          ListTile(
            title: const Text("Logout"),
            leading: const Icon(Icons.exit_to_app, color: Colors.red),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
