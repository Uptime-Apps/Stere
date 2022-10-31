import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../routes/navigation_controller.dart';
import '../../../views/authentication.dart';
import '../others/logo.dart';

class StereScaffold extends ConsumerWidget {
  const StereScaffold({required this.body, this.fab, this.bottomBar, Key? key})
      : super(key: key);
  final Widget body;
  final Widget? fab;
  final Widget? bottomBar;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const AppBarLogo(),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).pushReplacementNamed(AuthGate.route);
                FirebaseAuth.instance.signOut();
              },
              icon: const Icon(Icons.logout))
        ],
      ),
      bottomNavigationBar: bottomBar,
      body: body,
      floatingActionButton: fab,
      // floatingActionButtonLocation:
      //     bottomBar != null ? FloatingActionButtonLocation.centerFloat : null,
    );
  }
}

class StereMainScreenScaffold extends ConsumerWidget {
  const StereMainScreenScaffold({required this.body, this.fab, Key? key})
      : super(key: key);
  final Widget body;
  final Widget? fab;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const AppBarLogo(),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).pushReplacementNamed(AuthGate.route);
                FirebaseAuth.instance.signOut();
              },
              icon: const Icon(Icons.logout))
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: ref.watch(navigationControllerProvider).currentIndex,
        onTap: (i) => ref
            .read(navigationControllerProvider.notifier)
            .setCurrentIndex(context, i),
        items: ref
            .watch(navigationControllerProvider)
            .navigationItems
            .map((e) =>
                BottomNavigationBarItem(label: e.label, icon: Icon(e.icon)))
            .toList(),
      ),
      body: body,
      floatingActionButton: fab,
    );
  }
}
