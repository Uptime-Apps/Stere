import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../backend/models/asset/asset.dart';
import '../../../l10n/generated/l10n.dart';
import '../../../views/assets/list/asset_list_controller.dart';
import '../../constants/icons.dart';
import '../../constants/image_assets.dart';
import '../../constants/radius_values.dart';
import '../../constants/spacing_values.dart';
import '../others/shimmers.dart';
import '../others/utilities.dart';

class AssetListTile extends ConsumerWidget {
  const AssetListTile(this.asset, {super.key});
  final Asset asset;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const defaultImage =
        CircleAvatar(backgroundImage: AssetImage(iaDefaultCategoryImage));
    final imagePath = ref.watch(assetListImageProvider(asset));
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
      subtitle: Text(asset.categoryName),
      leading: img,
      trailing:
          Icon((!asset.isAutomotive) ? icCategories : icCategoriesAutomotive),
    );
  }
}

class RentedAssetListTile extends ConsumerWidget {
  const RentedAssetListTile({
    required this.asset,
    required this.price,
    required this.hoursRented,
    this.notes,
    this.damageReport,
    super.key,
  });
  final Asset asset;
  final double price;
  final int hoursRented;
  final String? notes;
  final String? damageReport;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const defaultImage =
        CircleAvatar(backgroundImage: AssetImage(iaDefaultCategoryImage));
    final imagePath = ref.watch(assetListImageProvider(asset));
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
    final bool hasNotes = notes?.isNotEmpty ?? false;
    final bool hasDamageReport = damageReport?.isNotEmpty ?? false;
    return ListTile(
      title: Text(asset.name),
      isThreeLine: true,
      subtitle: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          RawChip(
            label: Text(
              S.of(context).priceFormat(price),
              style:
                  TextStyle(color: Theme.of(context).colorScheme.onSecondary),
            ),
            backgroundColor: Theme.of(context).colorScheme.secondary,
          ),
          const DefaultSpacer(),
          Text(S.of(context).lblHours(hoursRented)),
        ],
      ),
      leading: img,
      trailing: (hasNotes || hasDamageReport)
          ? InkWell(
              borderRadius: BorderRadius.circular(kCardRadius),
              child: const Icon(Icons.info_outline),
              onTap: () => showDialog(
                context: context,
                builder: (context) {
                  var textTheme = Theme.of(context).textTheme;
                  return SimpleDialog(
                    title: const Text('More details'),
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: kHorizontalSpacing * 2,
                      vertical: kVerticalSpacing,
                    ),
                    children: [
                      if (hasNotes) ...[
                        Text(
                          S.of(context).lblNotesReport,
                          style: textTheme.subtitle1,
                        ),
                        const DefaultSpacer(dim: kSpacing / 3),
                        Text(notes!)
                      ],
                      if (hasNotes && hasDamageReport) ...[
                        const DefaultSpacer(),
                        const Divider(),
                        const DefaultSpacer(),
                      ],
                      if (hasDamageReport) ...[
                        Text(
                          S.of(context).lblDamageReport,
                          style: textTheme.subtitle1,
                        ),
                        const DefaultSpacer(dim: kSpacing / 3),
                        Text(damageReport!)
                      ]
                    ],
                  );
                },
              ),
            )
          : null,
    );
  }
}
