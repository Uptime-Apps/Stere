import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../backend/models/rental/deposit.dart';
import '../../../../core/components/inputs/form_fields.dart';
import '../../../../core/components/others/utilities.dart';
import '../../../../l10n/generated/l10n.dart';
import '../rental_form_controller.dart';

class StepClientDetails extends ConsumerWidget {
  const StepClientDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final prov = ref.watch(rentalFormControllerProvider);
    final notifier = ref.read(rentalFormControllerProvider.notifier);
    final formItems = [
      TextInputField(
        controller: prov.clientNameController,
        label: S.of(context).lblClientName,
        icon: Icons.text_format,
        textInputAction: TextInputAction.next,
        onEditingComplete: () => notifier.validateForm(),
      ),
      TextInputField(
        controller: prov.clientHousingController,
        label: S.of(context).lblClientHousing,
        icon: Icons.hotel,
        textInputAction: TextInputAction.next,
        onEditingComplete: () => notifier.validateForm(),
      ),
      NumericInputField(
        controller: prov.clientPhoneController,
        label: S.of(context).lblClientPhone,
        icon: Icons.phone,
        onEditingComplete: () => notifier.validateForm(),
      ),
      // NumericInputField(
      //   controller: ,
      //   label: S.of(context).lblBackupPhone,
      //   icon: Icons.phone,
      // ),
      SelectFormField(
        icon: Icons.contact_page_rounded,
        items: getDepositOptions(context),
        onChanged: (deposit) => notifier.selectDeposit(deposit),
        hint: S.of(context).lblClientDeposit,
      ),
    ];
    return ListView.separated(
      shrinkWrap: true,
      itemBuilder: (_, index) => formItems[index],
      itemCount: formItems.length,
      separatorBuilder: (_, __) => const DefaultSpacer(),
    );
  }

  List<DropdownMenuItem<String>> getDepositOptions(BuildContext context) {
    return [
      DropdownMenuItem(
          value: DepositEnum.identification.name,
          child: Text(S.of(context).optIdentification)),
      DropdownMenuItem(
          value: DepositEnum.passport.name,
          child: Text(S.of(context).optPassport))
    ];
  }
}
