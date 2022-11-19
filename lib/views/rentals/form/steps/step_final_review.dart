import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../backend/models/rental/deposit.dart';
import '../../../../core/components/chips/numeric_chips.dart';
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
        : const LoadingFinalReview();
    // : Container();
  }
}

class LoadingFinalReview extends StatelessWidget {
  const LoadingFinalReview({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class ValidFormFinalReview extends ConsumerWidget {
  const ValidFormFinalReview({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final prov = ref.watch(rentalFormControllerProvider);
    double totalPrice =
        prov.selectedAssets.map((e) => e.rentalPrice).reduce((a, b) => a + b);
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomerInformationTable(
            name: prov.clientNameController.text,
            deposit: prov.clientDeposit.value,
            identification: prov.clientIdController.text,
            housing: prov.clientHousingController.text,
            phone: prov.clientPhoneController.text,
            backupPhone: prov.backupPhoneController.text,
          ),
          ListTile(
              title: Text(S.of(context).lblSelectedAssets),
              leading: const Icon(icAssets)),
          Column(
            children:
                prov.selectedAssets.map((e) => RentedAssetListTile(e)).toList(),
          ),
          const Divider(),
          ListTile(
            title: Text(S.of(context).lblTotal),
            trailing: PriceChip(price: totalPrice),
          )
        ],
      ),
    );
  }
}

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
            title: Text(S.of(context).stepClientInformation),
            leading: const Icon(icAssets)),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: kCardSpacing * 1.5),
          child: Padding(
            padding: const EdgeInsets.only(bottom: kSpacing),
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
        ),
      ],
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
