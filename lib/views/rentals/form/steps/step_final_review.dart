import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/components/chips/numeric_chips.dart';
import '../../../../core/components/list_tiles/asset.dart';
import '../../../../core/components/others/tables.dart';
import '../../../../core/constants/icons.dart';
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
