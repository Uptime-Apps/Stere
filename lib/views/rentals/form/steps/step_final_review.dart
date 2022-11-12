import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../backend/models/rental/deposit.dart';
import '../../../../core/components/list_tiles/asset.dart';
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
    return Card(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            AssetListTile(prov.chosenAsset.value!),
            Padding(
              padding: const EdgeInsets.all(kCardSpacing * 2),
              child: Table(
                defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                children: [
                  buildRow(
                    [
                      S.of(context).lblClientName,
                      prov.clientNameController.text
                    ],
                  ),
                  buildRow(
                    [
                      S.of(context).lblClientDeposit,
                      prov.clientDeposit.value ==
                              DepositEnum.identification.name
                          ? S.of(context).lblClientDepositIdentification
                          : S.of(context).lblClientDepositPassport
                    ],
                  ),
                  buildRow([
                    S.of(context).lblClientHousing,
                    prov.clientHousingController.text
                  ]),
                  buildRow([
                    S.of(context).lblClientPhone,
                    prov.clientPhoneController.text
                  ]),
                  buildRow(
                      [S.of(context).lblHours, prov.hoursRented.toString()]),
                  buildRow([
                    S.of(context).lblInitialMileage,
                    prov.initialMileageController.text
                  ]),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> renderDetails(List<String?> details) {
    return details.map((e) => Text(e ?? 'INCOMPLETE')).toList();
  }
}

TableRow buildRow(List<String> cells) => TableRow(
    children: cells
        .map((e) => Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: kSpacing / 2, vertical: kSpacing / 4),
            child: Center(
              child: Text(e),
            )))
        .toList());

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
