import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../../../../../backend/models/asset/asset.dart';
import '../../../../../backend/models/rental/rental_asset.dart';
import '../../../../../backend/models/status/rental_status.dart';
import '../../../../../core/components/inputs/dropdowns.dart';
import '../../../../../core/components/others/utilities.dart';
import '../../../../../core/constants/radius_values.dart';
import '../../../../../l10n/generated/l10n.dart';
import '../../rental_form_controller.dart';
import 'rental_asset_form.dart';

class StepAvailableAssets extends ConsumerWidget {
  final logName = 'step-available-assets';
  const StepAvailableAssets(this.assetStream, {Key? key}) : super(key: key);
  final Stream<List<Asset>>? assetStream;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var prov = ref.watch(rentalFormControllerProvider);
    var notifier = ref.read(rentalFormControllerProvider.notifier);
    final colorScheme = Theme.of(context).colorScheme;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const AvailableAssetsDropdown(),
        const DefaultSpacer(),
        ListView.separated(
          shrinkWrap: true,
          itemCount: prov.selectedAssets.length,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            final obj = prov.selectedAssets[index];
            return Slidable(
              key: ValueKey<String>(obj.id),
              startActionPane: ActionPane(
                motion: const ScrollMotion(),
                extentRatio: 0.5,
                children: [
                  SlidableAction(
                    backgroundColor: colorScheme.surfaceVariant,
                    foregroundColor: colorScheme.onSurfaceVariant,
                    icon: Icons.edit,
                    onPressed: (context) async {
                      var res = await showModalBottomSheet<RentalAsset>(
                          isScrollControlled: true,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(kCardRadius)),
                          context: context,
                          builder: (context) => RentalAssetForm(obj));
                      if (res != null) {
                        notifier.editSelection(index, res);
                        // log(res.toString(), name: logName);
                      }
                    },
                  ),
                  SlidableAction(
                    backgroundColor: colorScheme.error,
                    foregroundColor: colorScheme.onError,
                    icon: Icons.delete,
                    onPressed: (context) {
                      notifier.removeSelection(obj.id);
                    },
                  ),
                ],
              ),
              child: ListTile(
                title: Text(obj.name),
                subtitle: Text(obj.categoryName),
                trailing: (obj.status == RentalAssetStatus.incomplete)
                    ? Tooltip(
                        message: S.of(context).ttIncomplete,
                        child: Icon(
                          Icons.pending,
                          color: colorScheme.secondary,
                        ),
                      )
                    : Tooltip(
                        message: S.of(context).ttReady,
                        child: Icon(
                          Icons.check,
                          color: colorScheme.primary,
                        ),
                      ),
              ),
            );
          },
          separatorBuilder: (_, __) => const Divider(),
        ),
      ],
    );
  }
}
