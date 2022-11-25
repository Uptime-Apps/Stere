import 'package:duration/duration.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../backend/models/asset/asset.dart';
import '../../../backend/models/rental/rental_asset.dart';
import '../../../backend/models/status/rental_status.dart';
import '../../../l10n/generated/l10n.dart';
import '../../../utils/extensions.dart';
import '../../../views/assets/list/asset_list_controller.dart';
import '../../constants/colors.dart';
import '../../constants/icons.dart';
import '../../constants/image_assets.dart';
import '../../constants/radius_values.dart';
import '../../constants/spacing_values.dart';
import '../chips/numeric_chips.dart';
import '../others/shimmers.dart';
import '../others/utilities.dart';

class AssetListTile extends ConsumerWidget {
  const AssetListTile(this.asset, {super.key});
  final Asset asset;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const defaultImage =
        CircleAvatar(backgroundImage: AssetImage(iaDefaultCategoryImage));
    final imagePath = ref.watch(assetListImageProvider(asset.imagePath));
    Widget img = imagePath.maybeWhen(
      orElse: () => defaultImage,
      data: (data) => (data != null)
          ? CircleAvatar(
              backgroundColor: Colors.transparent,
              foregroundImage: NetworkImage(data),
              child: const CircularLoadingSkeleton())
          : defaultImage,
      loading: () => const CircularLoadingSkeleton(),
    );

    Color statusColor = Colors.amber;
    if (asset.status == AssetStatus.available.name) {
      statusColor = Colors.green;
    }
    if (asset.status == AssetStatus.maintenance.name) {
      statusColor = Colors.grey;
    }
    if (asset.status == AssetStatus.rented.name) {
      statusColor = Colors.red.shade300;
    }
    return ListTile(
        title: Text(asset.name),
        subtitle: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(asset.categoryName),
          ],
        ),
        leading: img,
        trailing: RawChip(
          avatar: CircleAvatar(
              backgroundColor: Colors.white.withAlpha(180),
              foregroundColor: statusColor.withAlpha(230),
              child: Icon(
                (!asset.isAutomotive) ? icCategories : icCategoriesAutomotive,
                size: 20,
              )),
          label: Text(asset.status.capitalize()),
          backgroundColor: statusColor,
        ));
  }
}

class RentedAssetListTile extends ConsumerWidget {
  const RentedAssetListTile(
    this.rAsset, {
    this.relativeTime = true,
    super.key,
  });
  final RentalAsset rAsset;
  final bool relativeTime;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final hasNotes = rAsset.notes?.isNotEmpty ?? false;
    final hasDamageReport = rAsset.damageReport?.isNotEmpty ?? false;
    const defaultImage =
        CircleAvatar(backgroundImage: AssetImage(iaDefaultCategoryImage));
    final imagePath = ref.watch(assetListImageProvider(rAsset.image));
    Widget img = imagePath.maybeWhen(
      orElse: () => defaultImage,
      data: (data) => (data != null)
          ? CircleAvatar(
              backgroundColor: Colors.transparent,
              foregroundImage: NetworkImage(data),
              child: const CircularLoadingSkeleton())
          : defaultImage,
      loading: () => const CircularLoadingSkeleton(),
    );
    final bool isOverdue = (rAsset.returnTime != null &&
        rAsset.status == RentalAssetStatus.rented &&
        rAsset.returnTime!.difference(DateTime.now()).isNegative);
    final msgOverdue = (isOverdue) ? S.of(context).msgIsOverdue : null;
    return ListTile(
      title: Tooltip(
        message: rAsset.name,
        child: Text(rAsset.name, overflow: TextOverflow.ellipsis),
      ),
      isThreeLine: true,
      subtitle: Text(
        '$msgOverdue${printDuration(
          DateTime.now().difference(rAsset.returnTime!),
          abbreviated: true,
          tersity: DurationTersity.hour,
        )}',
      ),
      leading: (isOverdue)
          ? Tooltip(
              message: S.of(context).lblOverdue,
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(
                      color: clOverdue,
                      width: 3.0,
                      strokeAlign: StrokeAlign.outside,
                    ),
                    borderRadius:
                        const BorderRadius.all(Radius.circular(kCardRadius))),
                child: img,
              ))
          : img,
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          PriceChip(price: rAsset.rentalPrice),
          if (hasNotes || hasDamageReport) ...[
            const DefaultSpacer(),
            InkWell(
              borderRadius: BorderRadius.circular(kCardRadius),
              child: const Icon(Icons.info_outline),
              onTap: () => showDialog(
                context: context,
                builder: (context) {
                  var textTheme = Theme.of(context).textTheme;
                  return SimpleDialog(
                    insetPadding: const EdgeInsets.symmetric(horizontal: 0),
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: kHorizontalSpacing * 2,
                      vertical: kVerticalSpacing,
                    ),
                    children: [
                      if (hasNotes) ...[
                        Text(
                          S.of(context).lblNotesReport,
                          style: textTheme.headlineSmall,
                        ),
                        const DefaultSpacer(dim: kSpacing / 3),
                        Text(rAsset.notes!),
                        if (rAsset.initialMileage != null) ...[
                          const Divider(),
                          Text(
                            S.of(context).lblInitialMileage,
                            style: textTheme.titleSmall,
                          ),
                          Text(rAsset.initialMileage!.toString()),
                        ],
                      ],
                      if (hasNotes && hasDamageReport) const DefaultSpacer(),
                      if (hasDamageReport) ...[
                        Text(
                          S.of(context).lblDamageReport,
                          style: textTheme.headlineSmall,
                        ),
                        const DefaultSpacer(dim: kSpacing / 3),
                        Text(rAsset.damageReport!)
                      ]
                    ],
                  );
                },
              ),
            ),
          ],
        ],
      ),
    );
  }
}
