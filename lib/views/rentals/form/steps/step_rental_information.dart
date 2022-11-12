import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/components/inputs/form_fields.dart';
import '../../../../core/components/others/utilities.dart';
import '../../../../l10n/generated/l10n.dart';
import '../../../../utils/validators.dart';
import '../rental_form_controller.dart';

class StepRentalInformation extends ConsumerWidget {
  const StepRentalInformation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final prov = ref.watch(rentalFormControllerProvider);
    final notifier = ref.read(rentalFormControllerProvider.notifier);
    List<Widget> automotiveInputs = [];
    prov.chosenAsset.whenData(
      (asset) {
        if (asset.isAutomotive) {
          automotiveInputs = [
            NumericInputField(
              onChanged: (_) => notifier.validateForm(),
              controller: prov.initialMileageController,
              textInputAction: TextInputAction.next,
              icon: Icons.speed,
              label: '${S.of(context).lblInitialMileage}*',
            ),
          ];
        }
      },
    );
    final formItems = [
      SelectFormField(
        icon: Icons.watch_later_outlined,
        items: getHourOptions(context),
        onChanged: (hours) {
          if (hours != null) {
            notifier.selectHours(hours);
          }
        },
        validator: (value) =>
            (value == null) ? S.of(context).emFieldRequired : null,
        hint: '${S.of(context).lblHours}*',
      ),
      if (prov.hoursRented != null)
        NumericInputField(
          onChanged: (_) => notifier.validateForm(),
          controller: prov.rentalPriceController,
          icon: Icons.money,
          label: '${S.of(context).lblPrice}*',
          textInputAction: TextInputAction.next,
          validator: requiredFieldValidation,
        ),
      if (prov.hoursRented != null &&
          prov.rentalPriceController.text.isNotEmpty) ...[
        ...automotiveInputs,
        TextInputField(
          controller: prov.notesController,
          textInputAction: TextInputAction.newline,
          icon: Icons.library_books,
          label: S.of(context).lblNotesReport,
          maxLines: 8,
        ),
        TextInputField(
          controller: prov.damageReportController,
          textInputAction: TextInputAction.newline,
          icon: Icons.edit,
          label: S.of(context).lblDamageReport,
          maxLines: 8,
        ),
      ]
    ];
    return ListView.separated(
      shrinkWrap: true,
      itemBuilder: (_, index) => formItems[index],
      itemCount: formItems.length,
      separatorBuilder: (_, __) => const DefaultSpacer(),
    );
  }

  List<DropdownMenuItem<int>> getHourOptions(BuildContext context) {
    const hourOptions = [4, 8];
    return hourOptions
        .map((e) => DropdownMenuItem(
            value: e, child: Text('${e.toString()} ${S.of(context).lblHours}')))
        .toList();
  }
}
