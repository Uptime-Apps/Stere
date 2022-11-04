import 'package:flutter/material.dart';

import '../../constants/spacing_values.dart';

class StereBasicScaffold extends StatelessWidget {
  const StereBasicScaffold(
      {required this.title, required this.body, this.fab, super.key});

  final Widget body;
  final String title;
  final FloatingActionButton? fab;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kSpacing),
        child: body,
      ),
      floatingActionButton: fab,
    );
  }
}
