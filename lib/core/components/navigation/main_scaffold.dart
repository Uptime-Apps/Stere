import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../l10n/generated/l10n.dart';
import '../../../routes/navigation_controller.dart';
import '../../../views/assets/assets.dart';
import '../../../views/categories/category_form.dart';
import '../../../views/home/home.dart';
import '../../../views/rentals/rentals.dart';
import '../others/logo.dart';

class StereMainScreenScaffold extends ConsumerWidget {
  const StereMainScreenScaffold({this.fab, super.key});
  final Widget? fab;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var lang = S.of(context);
    final int index = ref.watch(navigationControllerProvider).currentIndex;
    final Widget view = ref
        .watch(navigationControllerProvider)
        .navigationItems
        .elementAt(index)
        .view;
    return Scaffold(
      appBar: AppBar(
        title: AppBarLogo(isHome: view is HomeScreen),
        actions: [
          PopupMenuButton<int>(
            offset: const Offset(0, -380),
            tooltip: lang.lblMore,
            onSelected: (item) async {
              switch (item) {
                case 0:
                  Navigator.of(context).pushNamed(CategoryForm.route);
                  break;
                case 1:
                  Navigator.of(context).pushReplacementNamed('/');
                  await ref
                      .read(navigationControllerProvider.notifier)
                      .signOut(context);
                  break;
                default:
                  return;
              }
            },
            itemBuilder: (context) => [
              if (view is HomeScreen)
                PopupMenuItem<int>(
                  value: 0,
                  child: Text(
                    lang.lblCreateObject(lang.lblCategories(1)),
                  ),
                ),
              PopupMenuItem<int>(value: 1, child: Text(lang.lblLogout)),
            ],
            child: const Icon(
              Icons.more_vert,
            ),
          ),
        ],
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: index,
        onDestinationSelected: (i) =>
            ref.read(navigationControllerProvider.notifier).setCurrentIndex(i),
        destinations: ref
            .watch(navigationControllerProvider)
            .navigationItems
            .map((e) =>
                NavigationDestination(label: e.label, icon: Icon(e.icon)))
            .toList(),
      ),
      body: view,
      floatingActionButton: getFab(view),
    );
  }

  FloatingActionButton? getFab(Widget view) {
    switch (view.runtimeType) {
      case AssetsScreen:
        return FloatingActionButton.extended(
          label: Text(S.current.lblCreateObject(S.current.lblAssets(1))),
          onPressed: () {},
          icon: const Icon(Icons.add),
        );
      case HomeScreen:
      case RentalScreen:
        return FloatingActionButton.extended(
          label: Text(S.current.lblCreateObject(S.current.lblRentals(1))),
          onPressed: () {},
          icon: const Icon(Icons.add),
        );
      default:
        return null;
    }
  }
}
