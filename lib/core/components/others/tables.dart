import 'package:flutter/material.dart';

import '../../../backend/models/rental/deposit.dart';
import '../../../l10n/generated/l10n.dart';
import '../../constants/icons.dart';
import '../../constants/spacing_values.dart';

class CustomerInformationTable extends StatelessWidget {
  const CustomerInformationTable({
    this.name,
    this.deposit,
    this.identification,
    this.housing,
    this.phone,
    this.backupPhone,
    super.key,
  });
  final String? name;
  final String? deposit;
  final String? identification;
  final String? housing;
  final String? phone;
  final String? backupPhone;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Column(
      children: [
        ListTile(
            title: Text(S.of(context).stepClientDetails),
            horizontalTitleGap: 0,
            leading: const Icon(icClientInformation)),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: kCardSpacing * 1.5,
            vertical: 0,
          ),
          child: Table(
            defaultVerticalAlignment: TableCellVerticalAlignment.middle,
            children: [
              buildRow(S.of(context).lblClientName,
                  name ?? S.of(context).lblNotAvailable, textTheme),
              buildRow(
                  S.of(context).lblClientDeposit,
                  deposit == DepositEnum.identification.name
                      ? S.of(context).lblClientDepositIdentification
                      : S.of(context).lblClientDepositPassport,
                  textTheme),
              buildRow(S.of(context).lblClientId,
                  identification ?? S.of(context).lblNotAvailable, textTheme),
              buildRow(S.of(context).lblClientHousing,
                  housing ?? S.of(context).lblNotAvailable, textTheme),
              buildRow(S.of(context).lblClientPhone,
                  phone ?? S.of(context).lblNotAvailable, textTheme),
              buildRow(S.of(context).lblClientBackupPhone,
                  backupPhone ?? S.of(context).lblNotAvailable, textTheme),
            ],
          ),
        ),
      ],
    );
  }

  TableRow buildRow(String label, String value, TextTheme theme) =>
      TableRow(children: [
        Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: kSpacing / 2, vertical: kSpacing / 4),
          child: Text(
            label,
            textAlign: TextAlign.start,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: kSpacing / 2, vertical: kSpacing / 4),
          child: Text(
            value,
            textAlign: TextAlign.end,
          ),
        ),
      ]);
}
