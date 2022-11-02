import 'package:flutter/material.dart';

import '../../constants/local_files.dart';

class StereBasicScaffold extends StatelessWidget {
  const StereBasicScaffold({required this.body, this.fab, super.key});

  final Widget body;
  final FloatingActionButton? fab;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: Image.asset(
            assetLogo,
            fit: BoxFit.contain,
            color: Theme.of(context).colorScheme.onSurface,
            height: 32,
          ),
        ),
      ),
      body: body,
      floatingActionButton: fab,
    );
  }
}
