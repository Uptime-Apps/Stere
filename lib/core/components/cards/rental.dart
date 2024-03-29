import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../../../backend/models/rental/rental.dart';
import '../../../backend/models/rental/rental_asset.dart';
import '../../../backend/models/status/rental_status.dart';
import '../../../backend/services/rental_service.dart';
import '../../../l10n/generated/l10n.dart';
import '../../../main.dart';
import '../../constants/spacing_values.dart';
import '../list_tiles/rental.dart';

class RentalCard extends ConsumerWidget {
  const RentalCard(this.rental, {super.key});
  final Rental rental;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;
    final child = RentalListTile(
      rental,
      endActionPane: (rental.status == RentalStatus.active)
          ? (rAsset) => ActionPane(
                motion: const ScrollMotion(),
                extentRatio: kSmallSwipeActionExtent,
                children: [
                  SlidableAction(
                    backgroundColor: colorScheme.primary,
                    foregroundColor: colorScheme.onPrimary,
                    label: S.of(context).lblReturn,
                    icon: Icons.check,
                    onPressed: (context) async {
                      RentalAsset? updatedAsset = await showDialog(
                          context: context,
                          builder: (context) => DialogReturnAsset(rAsset));
                      final ctx = StereApp.navKey.currentContext;
                      if (ctx != null) {
                        Navigator.of(ctx).pop();
                      }
                      if (updatedAsset != null) {
                        ref
                            .watch(rentalServiceProvider)
                            .returnAssetFromActiveRental(rental, updatedAsset);
                      }
                    },
                  ),
                ],
              )
          : null,
    );
    return (rental.status == RentalStatus.active)
        ? Slidable(
            key: ValueKey<String>(rental.id!),
            startActionPane: ActionPane(
              motion: const ScrollMotion(),
              extentRatio: kSmallSwipeActionExtent,
              children: [
                SlidableAction(
                  backgroundColor: colorScheme.error,
                  foregroundColor: colorScheme.onError,
                  label: S.of(context).lblCancel,
                  icon: Icons.cancel,
                  onPressed: (context) {
                    ref.watch(rentalServiceProvider).cancel(rental);
                  },
                ),
              ],
            ),
            child: child,
          )
        : Slidable(
            key: ValueKey<String>(rental.id!),
            startActionPane: ActionPane(
              motion: const ScrollMotion(),
              extentRatio: kSmallSwipeActionExtent,
              children: [
                SlidableAction(
                  backgroundColor: colorScheme.error,
                  foregroundColor: colorScheme.onError,
                  label: S.of(context).lblDelete,
                  icon: Icons.delete_forever,
                  onPressed: (context) =>
                      ref.watch(rentalServiceProvider).delete(rental),
                ),
              ],
            ),
            child: child,
          );
  }
}
