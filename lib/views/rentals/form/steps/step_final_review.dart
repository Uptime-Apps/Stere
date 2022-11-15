import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../backend/models/rental/deposit.dart';
import '../../../../core/components/list_tiles/asset.dart';
import '../../../../core/constants/icons.dart';
import '../../../../core/constants/spacing_values.dart';
import '../../../../l10n/generated/l10n.dart';
import '../rental_form_controller.dart';

class StepFinalReview extends ConsumerWidget {
  const StepFinalReview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return (ref.watch(rentalFormControllerProvider).validForm)
        ? const ValidFormFinalReview()
        : Container();
  }
}

class ValidFormFinalReview extends ConsumerWidget {
  const ValidFormFinalReview({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final prov = ref.watch(rentalFormControllerProvider);
    final double price = (prov.rentalPriceController.text.isNotEmpty)
        ? double.parse(prov.rentalPriceController.text)
        : 0;
    return Column(
      children: [
        ListTile(
            title: Text(S.of(context).stepClientInformation),
            leading: const Icon(icAssets)),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: kCardSpacing * 1.5),
          child: Column(
            children: [
              SectionTable(
                children: [
                  buildRow(
                    S.of(context).lblClientName,
                    prov.clientNameController.text,
                  ),
                  buildRow(
                      S.of(context).lblClientDeposit,
                      prov.clientDeposit.value ==
                              DepositEnum.identification.name
                          ? S.of(context).lblClientDepositIdentification
                          : S.of(context).lblClientDepositPassport),
                  buildRow(
                    S.of(context).lblClientId,
                    prov.clientIdController.text,
                  ),
                  buildRow(S.of(context).lblClientHousing,
                      prov.clientHousingController.text),
                  buildRow(S.of(context).lblClientPhone,
                      prov.clientPhoneController.text),
                  buildRow(S.of(context).lblClientBackupPhone,
                      prov.backupPhoneController.text),
                ],
              ),
            ],
          ),
        ),
        ListTile(
            title: Text(S.of(context).lblSelectedAssets),
            leading: const Icon(icAssets)),
        Card(
            child: Column(
          children: [
            RentedAssetListTile(
              asset: prov.chosenAsset.value!,
              hoursRented: prov.hoursRented ?? 0,
              price: price,
              notes: prov.notesController.text,
              damageReport: prov.damageReportController.text,
            )
          ],
        ))
      ],
    );
  }
}

class SectionTable extends StatelessWidget {
  const SectionTable(
      {this.title, this.aboveTable, required this.children, super.key});
  final String? title;
  final Widget? aboveTable;
  final List<TableRow> children;

  @override
  Widget build(BuildContext context) {
    final sectionStyle = Theme.of(context).textTheme.titleMedium;
    return Column(
      children: [
        if (title?.isNotEmpty ?? false) ...[
          Text(title!, style: sectionStyle),
          const Divider(),
        ],
        if (aboveTable != null) aboveTable!,
        Padding(
          padding: const EdgeInsets.only(bottom: kSpacing),
          child: Table(
            defaultVerticalAlignment: TableCellVerticalAlignment.middle,
            children: children,
          ),
        ),
      ],
    );
  }
}

TableRow buildRow(String label, String value) => TableRow(children: [
      Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: kSpacing / 2, vertical: kSpacing / 4),
          child: Text(label,
              textAlign: TextAlign.end,
              style: const TextStyle(fontWeight: FontWeight.bold))),
      Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: kSpacing / 2, vertical: kSpacing / 4),
          child: Text(value, textAlign: TextAlign.start)),
    ]);

class TinyListTile extends StatelessWidget {
  const TinyListTile({this.icon, required this.title, this.subtitle, Key? key})
      : super(key: key);
  final IconData? icon;
  final String title;
  final String? subtitle;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return ListTile(
      leading: Icon(icon, color: colorScheme.secondary),
      horizontalTitleGap: 0,
      dense: true,
      visualDensity: VisualDensity.compact,
      contentPadding: EdgeInsets.zero,
      title: Text(title),
      subtitle: subtitle != null ? Text(subtitle!) : null,
    );
  }
}
