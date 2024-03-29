import 'package:flutter/material.dart';

import '../../constants/spacing_values.dart';

class StereBasicScaffold extends StatelessWidget {
  const StereBasicScaffold(
      {required this.title,
      required this.body,
      this.leading,
      this.trailing,
      this.fab,
      this.bottomAppBar,
      super.key});

  final List<Widget>? trailing;
  final Widget body;
  final Widget? leading;
  final String title;
  final FloatingActionButton? fab;
  final PreferredSizeWidget? bottomAppBar;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: key,
      appBar: AppBar(
        title: Text(title),
        bottom: bottomAppBar,
        leading: leading,
        actions: trailing,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kSpacing),
        child: body,
      ),
      floatingActionButton: fab,
    );
  }
}
