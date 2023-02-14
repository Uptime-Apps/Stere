import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/components/lists/chips.dart';
import '../../core/components/others/images.dart';
import '../../core/constants/colors.dart';
import 'providers.dart';

import '../../backend/models/asset/asset.dart';
import '../../backend/models/rental/rental.dart';
import '../../backend/models/rental/rental_asset.dart';
import '../../backend/models/status/rental_status.dart';
import '../../backend/services/rental_service.dart';
import '../../core/components/cards/rental.dart';
import '../../core/components/lists/stream_list_view.dart';
import '../../core/components/others/basic_scaffold.dart';
import '../../core/constants/icons.dart';
import '../../core/constants/spacing_values.dart';
import '../../l10n/generated/l10n.dart';
import '../rentals/form/rental_form.dart';

class AssetDetailScreen extends ConsumerWidget {
  static const route = 'asset-detail-screen';
  const AssetDetailScreen(this.asset, {super.key});
  final Asset asset;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final img = ref.watch(assetImageProvider(asset.imagePath));
    return StereBasicScaffold(
      body: Flex(
        mainAxisSize: MainAxisSize.max,
        direction: Axis.vertical,
        children: [
          // Section containing the image
          DetailScreenImage(img),
          // Section containing the status and tags
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              if (asset.tags?.isNotEmpty ?? false)
                ChipsOverflowBar(asset.tags!),
              ListTile(
                  title: Text(
                    asset.status.local,
                  ),
                  dense: false,
                  visualDensity: VisualDensity.comfortable,
                  subtitle: Text(asset.categoryName),
                  trailing: Tooltip(
                      message: asset.status.local,
                      child:
                          Icon(asset.status.icon, color: asset.status.color))),
              // TODO table for automotive attributes and stats
              if (asset.isAutomotive) Table()
            ],
          ),
          // Section containing the list view
          Expanded(
            child: StreamListView<Rental>(
              filterData: (data) {
                return data.where((element) =>
                    element.assets.map((a) => a.id).contains(asset.id));
              },
              onData: (documents) => (documents?.isNotEmpty ?? false)
                  ? documents!.map((e) => RentalCard(e)).toList()
                  : null,
              stream: ref.read(rentalServiceProvider).getOrderedByDate(),
              headerBuilder: (context, snapshot) {
                final data = snapshot.value;
                double total = 0;
                List<RentalAsset> prices = [];
                if (data != null && data.isNotEmpty) {
                  snapshot.value?.forEach((r) => prices.addAll(r.assets));
                  total =
                      prices.map((r) => r.rentalPrice).reduce((a, b) => a + b);
                }
                return _DetailListViewHeader(total: total, asset: asset);
              },
              noContentMessage: S.of(context).msgNoRentalsActive,
              noContentIcon: icRentals,
              noContentActionRoute: RentalForm.route,
            ),
          ),
        ],
      ),
      title: asset.name,
    );
  }
}

class _DetailListViewHeader extends StatelessWidget {
  const _DetailListViewHeader({
    Key? key,
    required this.total,
    required this.asset,
  }) : super(key: key);

  final double total;
  final Asset asset;

  @override
  Widget build(BuildContext context) {
    double profit = total - asset.price.toDouble();
    return Column(
      children: [
        const Divider(),
        Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: kHorizontalSpacing, vertical: kVerticalSpacing),
          child: Table(
            columnWidths: const {0: FlexColumnWidth(2), 1: FlexColumnWidth(1)},
            children: [
              buildTableRow(
                label: Text(S.of(context).lblAssetPrice),
                value: asset.price.toDouble(),
              ),
              // Total
              buildTableRow(
                label: Text(S.of(context).lblTotal),
                value: total,
              ),
              // Profit
              buildTableRow(
                label: Text(
                  S.of(context).lblProfit,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                value: profit,
                valueColor: (profit.isNegative) ? clExpense : clIncome,
              ),
            ],
          ),
        ),
        const Divider(),
      ],
    );
  }
}

TableRow buildTableRow({
  required Text label,
  required double value,
  Color? valueColor,
}) {
  return TableRow(
    children: [
      label,
      Text(
        S.current.priceFormat(value),
        textAlign: TextAlign.end,
        style: TextStyle(
          color: valueColor,
          fontWeight: (valueColor != null) ? FontWeight.bold : null,
        ),
      )
    ]
        .map((e) => Padding(
              padding: const EdgeInsets.all(kSpacing) / 2,
              child: e,
            ))
        .toList(),
  );
}
