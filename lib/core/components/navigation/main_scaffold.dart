import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../l10n/generated/l10n.dart';
import '../../../routes/navigation_controller.dart';
import '../../../views/assets/asset_form.dart';
import '../../../views/assets/asset.dart';
import '../../../views/categories/category.dart';
import '../../../views/categories/form/category_form.dart';
import '../../../views/home/home.dart';
import '../../../views/rentals/rental_form.dart';
import '../../../views/rentals/rental.dart';
import '../others/logo.dart';

class StereMainScreenScaffold extends ConsumerWidget {
  const StereMainScreenScaffold({this.fab, super.key});
  final Widget? fab;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
          IconButton(
            onPressed: () async {
              await ref
                  .read(navigationControllerProvider.notifier)
                  .signOut(context);
            },
            icon: const Icon(Icons.logout),
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
      floatingActionButton: getFab(context, view),
    );
  }

  FloatingActionButton? getFab(BuildContext context, Widget view) {
    switch (view.runtimeType) {
      case CategoryScreen:
        return FloatingActionButton.extended(
          label: Text(S.current.lblCreateObject(S.current.lblCategories(1))),
          onPressed: () => Navigator.of(context).pushNamed(CategoryForm.route),
          icon: const Icon(Icons.add),
        );
      case AssetScreen:
        return FloatingActionButton.extended(
          label: Text(S.current.lblCreateObject(S.current.lblAssets(1))),
          onPressed: () => Navigator.of(context).pushNamed(AssetForm.route),
          icon: const Icon(Icons.add),
        );
      case HomeScreen:
      case RentalScreen:
        return FloatingActionButton.extended(
          label: Text(S.current.lblCreateObject(S.current.lblRentals(1))),
          onPressed: () => Navigator.of(context).pushNamed(RentalForm.route),
          icon: const Icon(Icons.add),
        );
      default:
        return null;
    }
  }
}
