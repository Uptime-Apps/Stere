import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../routes/navigation_controller.dart';
import '../others/logo.dart';

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
              onPressed: () => ref
                  .read(navigationControllerProvider.notifier)
                  .signOut(context),
              icon: const Icon(Icons.logout))
        ],
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: ref.watch(navigationControllerProvider).currentIndex,
        onDestinationSelected: (i) => ref
            .read(navigationControllerProvider.notifier)
            .setCurrentIndex(context, i),
        destinations: ref
            .watch(navigationControllerProvider)
            .navigationItems
            .map((e) =>
                NavigationDestination(label: e.label, icon: Icon(e.icon)))
            .toList(),
      ),
      body: body,
      floatingActionButton: fab,
    );
  }
}
