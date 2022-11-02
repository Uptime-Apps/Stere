import 'package:flutter/material.dart';

import '../core/components/others/logo.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({required this.errorMsg, Key? key}) : super(key: key);
  final String errorMsg;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const AppBarLogo(),
      ),
      body: Center(
        child: Text(errorMsg),
      ),
    );
  }
}
