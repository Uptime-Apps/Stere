import 'package:flutter/material.dart';

import '../main.dart';

void showSimpleSnackbar(String text) {
  final context = StereApp.navKey.currentContext;
  if (context != null) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(text),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }
}
