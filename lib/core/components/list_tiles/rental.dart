import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../backend/models/rental/rental.dart';
import '../../../l10n/generated/l10n.dart';
import '../../constants/icons.dart';
import '../../constants/radius_values.dart';
import '../../constants/spacing_values.dart';
import '../chips/numeric_chips.dart';
import 'asset.dart';
import '../others/tables.dart';
import '../others/utilities.dart';

class RentalCard extends StatelessWidget {
  const RentalCard(this.rental, {super.key});
  final Rental rental;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return ListTile(
      visualDensity: VisualDensity.compact,
      dense: true,
      title: Text(rental.clientName),
      subtitle:
          Text(DateFormat.yMMMEd().format(rental.creationDate).toString()),
      leading: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Tooltip(
            message:
                '${rental.assets.length.toString()} ${S.of(context).lblAssets(rental.assets.length)}',
            child: Badge(
              badgeContent: Text(
                rental.assets.length.toString(),
                style: TextStyle(
                  color: colorScheme.onErrorContainer,
                ),
              ),
              badgeColor: colorScheme.errorContainer,
              child: const Icon(icAssets),
            ),
          ),
        ],
      ),
      trailing: Row(mainAxisSize: MainAxisSize.min, children: [
        PriceChip(
            price: rental.assets
                .map((e) => e.rentalPrice)
                .reduce((a, b) => a + b)),
        const DefaultSpacer(),
        InkWell(
          onTap: () => showModalBottomSheet(
            // isScrollControlled: true,
            // backgroundColor: colorScheme.primary,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(kCardRadius),
            ),

            context: context,
            builder: (context) => SimpleDialog(
              insetPadding: EdgeInsets.zero,
              title: Text(S.of(context).stepRentalInformation),
              children: [
                CustomerInformationTable(
                  name: rental.clientName,
                  deposit: rental.clientDeposit,
                  identification: rental.clientId,
                  housing: rental.clientHousing,
                  phone: rental.clientPhone,
                  backupPhone: rental.backupPhone,
                ),
                ListTile(
                    title: Text(S.of(context).lblSelectedAssets),
                    horizontalTitleGap: 0,
                    leading: const Icon(icAssets)),
                ...rental.assets.map((e) => RentedAssetListTile(e)).toList(),
              ],
            ),
          ),
          child: Tooltip(
            message: S.of(context).lblMore,
            child: const Icon(icInfo),
          ),
        ),
      ]),
    );
  }

  TableRow buildRow(String label, String value, TextTheme theme) =>
      TableRow(children: [
        Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: kSpacing / 2, vertical: kSpacing / 4),
            child: Text(label,
                textAlign: TextAlign.start,
                style: theme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ))),
        Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: kSpacing / 2, vertical: kSpacing / 4),
            child: Text(value, textAlign: TextAlign.end)),
      ]);
}
