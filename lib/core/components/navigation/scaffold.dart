import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../l10n/generated/l10n.dart';
import '../../../routes/navigation_controller.dart';
import '../others/logo.dart';

class StereMainScreenScaffold extends ConsumerWidget {
  const StereMainScreenScaffold({required this.body, this.fab, Key? key})
      : super(key: key);
  final Widget body;
  final Widget? fab;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var lang = S.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const AppBarLogo(),
        actions: [
          PopupMenuButton<int>(
            offset: const Offset(0, -380),
            tooltip: lang.lblMore,
            itemBuilder: (context) => [
              PopupMenuItem<int>(
                child: Text(lang.lblCreateObject(lang.lblCategories(1))),
                onTap: () {
                  // TODO push categories view
                },
              ),
              PopupMenuItem<int>(
                child: Text(lang.lblLogout),
                onTap: () => ref
                    .read(navigationControllerProvider.notifier)
                    .signOut(context),
              ),
            ],
            child: const Icon(
              Icons.more_vert,
            ),
          )
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
