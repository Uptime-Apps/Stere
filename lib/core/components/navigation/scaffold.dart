import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../others/logo.dart';

class StereScaffold extends ConsumerWidget {
  const StereScaffold(
      {required this.body, this.fab, this.bottomNavigationBar, Key? key})
      : super(key: key);
  final Widget body;
  final Widget? fab;
  final Widget? bottomNavigationBar;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const AppBarLogo(),
        actions: [
          IconButton(
              onPressed: () => FirebaseAuth.instance.signOut(),
              icon: const Icon(Icons.logout))
        ],
      ),
      bottomNavigationBar: bottomNavigationBar,
      body: body,
      floatingActionButton: fab,
    );
  }
}
