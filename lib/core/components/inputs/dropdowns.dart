import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../backend/models/asset/asset.dart';
import '../../../backend/models/status/rental_status.dart';
import '../../../l10n/generated/l10n.dart';
import '../../../views/rentals/form/rental_form_controller.dart';
import '../others/shimmers.dart';
import 'form_fields.dart';

class AvailableAssetsDropdown extends ConsumerWidget {
  const AvailableAssetsDropdown({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var prov = ref.watch(rentalFormControllerProvider);
    var notifier = ref.read(rentalFormControllerProvider.notifier);
    return prov.assets.maybeWhen(
      orElse: () => const ShimmeringInput(),
      data: (stream) => StreamBuilder(
        builder: (context, snapshot) {
          if (snapshot.hasData && snapshot.data!.isNotEmpty) {
            List<Asset> unselectedMenuItems = (prov.selectedAssets.isEmpty)
                ? snapshot.data!
                : snapshot.data!
                    .where((asset) =>
                        prov.selectedAssets.indexWhere(
                            (rentalAsset) => asset.id == rentalAsset.id) ==
                        -1)
                    .toList();
            var menuItems = unselectedMenuItems
                .where((asset) => asset.status == AssetStatus.available.name)
                .map(
                  (e) => DropdownMenuItem(
                    value: e,
                    child: SizedBox(
                      height: 50,
                      width: MediaQuery.of(context).size.width / 2,
                      child: ListTile(
                        onTap: () {
                          notifier.addSelection(e);
                          Navigator.of(context).pop();
                        },
                        visualDensity: VisualDensity.compact,
                        title: Tooltip(
                          message: e.name,
                          child: Text(e.name, overflow: TextOverflow.ellipsis),
                        ),
                        subtitle: Text(e.categoryName),
                      ),
                    ),
                  ),
                )
                .toList();

            return SelectFormField(
              items: menuItems,
              icon: Icons.shopping_bag,
              onChanged: (asset) => {
                // ref.read(rentalFormControllerProvider.notifier).selectAsset(asset)
              },
              hint: S.of(context).lblAvailableCount(
                  S.of(context).lblAssets(2), menuItems.length.toString()),
              selectedItemBuilder: (context) => snapshot.data!
                  .map((e) => SizedBox(
                      width: MediaQuery.of(context).size.width / 3,
                      child: Text(e.name, overflow: TextOverflow.ellipsis)))
                  .toList(),
            );
          } else {
            return const ShimmeringInput();
          }
        },
        stream: stream,
      ),
    );
  }
}
