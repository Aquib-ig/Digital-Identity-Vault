import 'package:flutter/material.dart';

class Utilities {
  static showSnacbar({
    required String message,
    required BuildContext context,
    Color color = Colors.green,
  }) {
    return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
      backgroundColor: color,
      behavior: SnackBarBehavior.floating,
    ));
  }

  static navigateTo({required BuildContext context, required Widget screen}) {
    return Navigator.push(
        context, MaterialPageRoute(builder: (context) => screen));
  }
}
