import 'package:flutter/material.dart';

class Helper {
  BuildContext context;
  Helper(this.context);
  void showSnackbar(
    String message,
  ) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 2),
      ),
    );
  }
}
