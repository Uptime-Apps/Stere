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
              foregroundColor: asset.status.color?.withAlpha(230),
              child: Icon(
                (!asset.isAutomotive) ? icCategories : icCategoriesAutomotive,
                size: 20,
              )),
          label: Text(asset.status.local.capitalize()),
          backgroundColor: asset.status.color,
        ));
  }
}

class RentedAssetFormat {
  Color? color;
  late IconData icon;
  late String label;
  late String tooltip;

  RentedAssetFormat({required RentalAsset rAsset, required bool relativeTime}) {
    final bool isOverdue = (rAsset.returnTime != null &&
        rAsset.status == RentalAssetStatus.rented &&
        rAsset.returnTime!.difference(DateTime.now()).isNegative);
    color = isOverdue ? clOverdue : null;
    if (rAsset.status == RentalAssetStatus.available) {
      // If it's been returned
      label = S.current.lblHours(rAsset.hoursRented);
      icon = Icons.lock_clock;
      tooltip = S.current.pfxRentedFor(
        prettyDuration(
          Duration(hours: rAsset.hoursRented),
          tersity: DurationTersity.minute,
        ),
      );
    } else if (isOverdue) {
      // If it's overdue
      label = prettyDuration(
        DateTime.now().difference(rAsset.returnTime!),
        tersity: DurationTersity.minute,
      );
      icon = Icons.warning;
      tooltip = S.current.ttOverdue;
    } else if (rAsset.returnTime != null) {
      // If it's not overdue and relative time is available
      label = prettyDuration(
        rAsset.returnTime!.difference(DateTime.now()),
        tersity: DurationTersity.minute,
      );
      icon = Icons.timelapse;
      tooltip = S.current.ttTimeRemaining;
    } else {
      // Not overdue and relative time not defined
      label = S.current.lblHours(rAsset.hoursRented);
      icon = Icons.lock_clock;
      tooltip = S.current.pfxRentedFor(
        prettyDuration(
          Duration(hours: rAsset.hoursRented),
          tersity: DurationTersity.minute,
        ),
      );
    }
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
    // rental details
    final hasNotes = rAsset.notes?.isNotEmpty ?? false;
    final hasDamageReport = rAsset.damageReport?.isNotEmpty ?? false;

    // rental image
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

    final raf = RentedAssetFormat(rAsset: rAsset, relativeTime: relativeTime);
    return ListTile(
      title: Tooltip(
        message: rAsset.name,
        child: Text(rAsset.name, overflow: TextOverflow.ellipsis),
      ),
      isThreeLine: true,
      subtitle: Text.rich(
        TextSpan(
          children: [
            WidgetSpan(
                child: Tooltip(
                  message: raf.tooltip,
                  child: Icon(
                    color: raf.color,
                    raf.icon,
                    size: Theme.of(context).textTheme.subtitle1?.fontSize,
                  ),
                ),
                alignment: PlaceholderAlignment.top),
            TextSpan(text: '\t${raf.label}'),
          ],
        ),
        style: (raf.color != null) ? TextStyle(color: raf.color) : null,
      ),
      leading: img,
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
                        if (rAsset.isAutomotive) ...[
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
