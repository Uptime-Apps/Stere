import 'package:flutter/material.dart';

void showSimpleSnackbar(BuildContext context, String text) =>
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(text)),
    );
