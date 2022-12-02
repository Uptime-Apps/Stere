import 'package:flutter/material.dart';

import '../../../../../backend/models/rental/rental_asset.dart';
import '../../../../../backend/models/status/rental_status.dart';
import '../../../../../core/components/inputs/form_fields.dart';
import '../../../../../core/components/others/filled_button.dart';
import '../../../../../core/components/others/utilities.dart';
import '../../../../../core/constants/spacing_values.dart';
import '../../../../../l10n/generated/l10n.dart';
import '../../../../../utils/validators.dart';

class RentalAssetForm extends StatefulWidget {
  const RentalAssetForm(this.rAsset, {super.key});
  final RentalAsset rAsset;

  @override
  State<RentalAssetForm> createState() => _RentalAssetFormState();
}

class _RentalAssetFormState extends State<RentalAssetForm> {
  final String logName = 'rental-form-state';
  double? initialMileage;
  double? finalMileage;
  String? notes;
  String? damageReport;
  int hoursRented = 0;
  double price = 0.0;
  RentalAssetStatus status = RentalAssetStatus.incomplete;

  @override
  void initState() {
    super.initState();
    hoursRented = widget.rAsset.hoursRented;
    price = widget.rAsset.rentalPrice;
    notes = widget.rAsset.notes;
    damageReport = widget.rAsset.damageReport;
    initialMileage = widget.rAsset.initialMileage;
    finalMileage = widget.rAsset.finalMileage;
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> formItems = [
      Text(widget.rAsset.name,
          style: Theme.of(context).textTheme.headlineSmall),
      SelectFormField(
        icon: Icons.watch_later_outlined,
        items: getHourOptions(context),
        onChanged: (value) =>
            setState(() => (value != null) ? hoursRented = value : 0.0),
        validator: (value) =>
            (value == null) ? S.of(context).emFieldRequired : null,
        hint: '${S.of(context).lblHours(hoursRented)}*',
      ),
      NumericInputField(
        initialValue: (price != 0) ? price.toString() : null,
        onChanged: (value) => setState(() {
          try {
            if (value != null) {
              price = double.parse(value);
            }
          } on FormatException {
            price = 0.0;
          }
        }),
        icon: Icons.money,
        label: '${S.of(context).lblPrice}*',
        textInputAction: TextInputAction.next,
        validator: requiredFieldValidation,
      ),
      TextInputField(
        initialValue: notes,
        textInputAction: TextInputAction.newline,
        icon: Icons.library_books,
        label: S.of(context).lblNotesReport,
        maxLines: 4,
        onChanged: (value) => setState(() => notes = value),
      ),
      TextInputField(
        initialValue: damageReport,
        textInputAction: TextInputAction.newline,
        icon: Icons.edit,
        label: S.of(context).lblDamageReport,
        maxLines: 3,
        onChanged: (value) => setState(() => damageReport = value),
      ),
    ];
    return Container(
      height: MediaQuery.of(context).size.height * 0.7,
      padding: const EdgeInsets.all(kCardSpacing * 3),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: ListView.separated(
              itemBuilder: (context, index) => formItems[index],
              physics: const NeverScrollableScrollPhysics(),
              itemCount: formItems.length,
              separatorBuilder: (_, __) => const DefaultSpacer(),
            ),
          ),
          const DefaultSpacer(),
          FilledButton(
            width: double.infinity,
            label: Text(
              S.of(context).lblConfirm,
              textAlign: TextAlign.center,
            ),
            onPressed: submit,
          )
        ],
      ),
    );
  }

  bool validForm() => (hoursRented != 0 && price != 0);

  void submit() {
    RentalAsset ra = RentalAsset(
      isAutomotive: widget.rAsset.isAutomotive,
      categoryId: widget.rAsset.categoryId,
      categoryName: widget.rAsset.categoryName,
      damageReport: damageReport,
      finalMileage: finalMileage,
      hoursRented: hoursRented,
      id: widget.rAsset.id,
      image: widget.rAsset.image,
      initialMileage: initialMileage,
      name: widget.rAsset.name,
      notes: notes,
      rentalPrice: price,
      status:
          validForm() ? RentalAssetStatus.ready : RentalAssetStatus.incomplete,
    );

    Navigator.of(context).pop(ra);
  }

  List<DropdownMenuItem<int>> getHourOptions(BuildContext context) {
    const hourOptions = [4, 8];
    return hourOptions
        .map((e) =>
            DropdownMenuItem(value: e, child: Text(S.of(context).lblHours(e))))
        .toList();
  }
}
