import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../../../../backend/models/asset/asset.dart';
import '../../../../backend/models/status/rental_status.dart';
import '../../../../core/components/inputs/dropdowns.dart';
import '../../../../core/components/others/utilities.dart';
import '../../../../core/constants/radius_values.dart';
import '../../../../core/constants/spacing_values.dart';
import '../../../../l10n/generated/l10n.dart';
import '../rental_form_controller.dart';

class StepAvailableAssets extends ConsumerWidget {
  const StepAvailableAssets(this.assetsFuture, {Key? key}) : super(key: key);
  final Future<List<Asset>>? assetsFuture;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var prov = ref.watch(rentalFormControllerProvider);
    var notifier = ref.read(rentalFormControllerProvider.notifier);
    final colorScheme = Theme.of(context).colorScheme;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        AvailableAssetsDropdown(assetsFuture: assetsFuture),
        const DefaultSpacer(),
        prov.selectedAssets.maybeWhen(
            data: (data) => ListView.separated(
                  shrinkWrap: true,
                  itemCount: data.length,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    final obj = data[index];
                    return Slidable(
                      // Specify a key if the Slidable is dismissible.
                      key: ValueKey<String>(obj.id),

                      // The end action pane is the one at the right or the bottom side.
                      endActionPane: ActionPane(
                        motion: const DrawerMotion(),
                        extentRatio: 0.5,
                        children: [
                          Flexible(
                            flex: 1,
                            child: Tooltip(
                              message: S.of(context).lblEdit,
                              child: SlidableAction(
                                backgroundColor: colorScheme.primary,
                                foregroundColor: colorScheme.onPrimary,
                                icon: Icons.edit,
                                onPressed: (context) {
                                  showModalBottomSheet(
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                              kCardRadius)),
                                      context: context,
                                      builder: (context) {
                                        return Padding(
                                          padding: const EdgeInsets.all(
                                              kCardSpacing),
                                          child: Column(
                                            children: [
                                              Text(obj.name,
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .headlineSmall),
                                            ],
                                          ),
                                        );
                                      });
                                },
                              ),
                            ),
                          ),
                          Flexible(
                            flex: 1,
                            child: Tooltip(
                              message: S.of(context).lblDelete,
                              child: SlidableAction(
                                backgroundColor: colorScheme.error,
                                foregroundColor: colorScheme.onError,
                                icon: Icons.delete,
                                onPressed: (context) {
                                  notifier.removeSelection(obj.id);
                                },
                              ),
                            ),
                          ),
                        ],
                      ),

                      // The child of the Slidable is what the user sees when the
                      // component is not dragged.
                      child: ListTile(
                        title: Text(obj.name),
                        subtitle: Text(obj.categoryName),
                        trailing: (obj.status == RentalAssetStatus.incomplete)
                            ? Tooltip(
                                message: S.of(context).ttIncomplete,
                                child: Icon(
                                  Icons.pending,
                                  color: colorScheme.secondary,
                                ))
                            : null,
                      ),
                    );
                  },
                  separatorBuilder: (_, __) => const Divider(),
                ),
            orElse: () => const DefaultSpacer()),
      ],
    );
  }
}
