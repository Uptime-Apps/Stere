import 'package:flutter/material.dart';

import '../core/components/navigation/scaffold.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({required this.errorMsg, Key? key}) : super(key: key);
  final String errorMsg;

  @override
  Widget build(BuildContext context) {
    return StereMainScreenScaffold(
      body: Center(
        child: Text(errorMsg),
      ),
    );
  }
}
