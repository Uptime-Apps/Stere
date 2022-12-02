import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';

import '../../../backend/models/rental/rental.dart';
import '../../../backend/models/rental/rental_asset.dart';
import '../../../backend/models/status/rental_status.dart';
import '../../../backend/services/rental_service.dart';
import '../../../l10n/generated/l10n.dart';
import '../../../utils/validators.dart';
import '../../constants/icons.dart';
import '../../constants/radius_values.dart';
import '../../constants/spacing_values.dart';
import '../chips/numeric_chips.dart';
import '../inputs/form_fields.dart';
import '../others/filled_button.dart';
import 'asset.dart';
import '../others/tables.dart';
import '../others/utilities.dart';

class DialogReturnAsset extends StatefulWidget {
  const DialogReturnAsset(this.rAsset, {super.key});
  final RentalAsset rAsset;

  @override
  State<DialogReturnAsset> createState() => _DialogReturnAssetState();
}

class _DialogReturnAssetState extends State<DialogReturnAsset> {
  final String logName = 'dialog-return-asset-state';
  double? initialMileage;
  late TextEditingController finalMileage;
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
    finalMileage =
        TextEditingController(text: (initialMileage ?? 0).toString());
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> automotiveInputs = [
      NumericInputField(
        initialValue: widget.rAsset.initialMileage.toString(),
        icon: Icons.edit_note,
        label: S.of(context).lblInitialMileage,
        textInputAction: TextInputAction.next,
        validator: requiredFieldValidation,
        enabled: false,
      ),
      const DefaultSpacer(),
      NumericInputField(
        controller: finalMileage,
        icon: Icons.edit_note,
        label: '${S.of(context).lblFinalMileage}*',
        textInputAction: TextInputAction.next,
        validator: requiredFieldValidation,
        onChanged: (_) => setState(() => validForm()),
      ),
      const DefaultSpacer(),
    ];

    return SimpleDialog(
      contentPadding: const EdgeInsets.all(kSpacing * 1.5),
      title: Text(widget.rAsset.name),
      children: [
        Text(S.of(context).msgReturnRentalAsset),
        const DefaultSpacer(),
        if (widget.rAsset.isAutomotive) ...automotiveInputs,
        TextInputField(
          initialValue: notes,
          textInputAction: TextInputAction.newline,
          icon: Icons.library_books,
          label: S.of(context).lblNotesReport,
          maxLines: 4,
          onChanged: (value) => setState(() => notes = value),
        ),
        const DefaultSpacer(),
        TextInputField(
          initialValue: damageReport,
          textInputAction: TextInputAction.newline,
          icon: Icons.edit,
          label: S.of(context).lblDamageReport,
          maxLines: 3,
          onChanged: (value) => setState(() => damageReport = value),
        ),
        const DefaultSpacer(),
        FilledButton(
          label: Text(S.of(context).lblReturn),
          onPressed: validForm()
              ? () {
                  Navigator.of(context).pop(
                    widget.rAsset.copyWith(
                      damageReport: damageReport,
                      notes: notes,
                      initialMileage: initialMileage,
                      finalMileage: double.parse(finalMileage.text),
                    ),
                  );
                }
              : null,
        ),
      ],
    );
  }

  bool validForm() {
    bool validAutomotive = widget.rAsset.isAutomotive &&
        ((finalMileage.text.isEmpty) ? 0 : double.parse(finalMileage.text)) >
            initialMileage!;
    return validAutomotive || !widget.rAsset.isAutomotive;
  }

  void submit() {
    RentalAsset ra = RentalAsset(
      isAutomotive: widget.rAsset.isAutomotive,
      categoryId: widget.rAsset.categoryId,
      categoryName: widget.rAsset.categoryName,
      damageReport: damageReport,
      finalMileage: double.parse(finalMileage.text),
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
}

class RentalCard extends ConsumerWidget {
  const RentalCard(this.rental, {super.key});
  final Rental rental;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;
    final child = RentalListTile(
      rental,
      endActionPane: (rental.status == RentalStatus.active)
          ? (rAsset) => ActionPane(
                motion: const ScrollMotion(),
                extentRatio: kSwipeActionExtent,
                children: [
                  SlidableAction(
                    backgroundColor: colorScheme.primary,
                    foregroundColor: colorScheme.onPrimary,
                    label: S.of(context).lblReturn,
                    icon: Icons.check,
                    onPressed: (context) async {
                      RentalAsset? updatedAsset = await showDialog(
                          context: context,
                          builder: (context) => DialogReturnAsset(rAsset));
                      if (updatedAsset != null) {
                        ref
                            .watch(rentalServiceProvider)
                            .returnAssetFromActiveRental(rental, updatedAsset);
                      }
                    },
                  ),
                ],
              )
          : null,
    );
    return Card(
      clipBehavior: Clip.hardEdge,
      elevation: 0,
      child: (rental.status == RentalStatus.active)
          ? Slidable(
              key: ValueKey<String>(rental.id!),
              startActionPane: ActionPane(
                motion: const ScrollMotion(),
                extentRatio: kSwipeActionExtent,
                children: [
                  SlidableAction(
                    backgroundColor: colorScheme.error,
                    foregroundColor: colorScheme.onError,
                    label: S.of(context).lblCancel,
                    icon: Icons.cancel,
                    onPressed: (context) {
                      ref.watch(rentalServiceProvider).cancel(rental);
                    },
                  ),
                ],
              ),
              child: child)
          : child,
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

class RentalListTile extends StatelessWidget {
  const RentalListTile(this.rental,
      {this.endActionPane, this.startActionPane, super.key});
  final ActionPane Function(RentalAsset)? endActionPane;
  final ActionPane Function(RentalAsset)? startActionPane;
  final Rental rental;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    return ListTile(
      visualDensity: VisualDensity.compact,
      dense: true,
      title: Text(rental.clientName),
      subtitle: Text(DateFormat.MMMEd().format(rental.creationDate).toString()),
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
              child: Icon(
                icAssets,
                color: (rental.status == RentalStatus.active &&
                        rental.assets
                            .map((e) => e.returnTime!
                                .difference(DateTime.now())
                                .isNegative)
                            .toList()
                            .contains(true))
                    ? RentalStatus.overdue.color
                    : rental.status.color,
              ),
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
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(kCardRadius),
            ),
            context: context,
            builder: (context) => SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(
                        kSpacing, kSpacing, kSpacing, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          S.of(context).stepRentalInformation,
                          style: textTheme.headlineSmall,
                        ),
                        Text(rental.status.local, style: textTheme.subtitle1),
                      ],
                    ),
                  ),
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
                  ...rental.assets.map((e) {
                    return Slidable(
                      key: ValueKey<String>(e.id),
                      endActionPane:
                          (endActionPane != null) ? endActionPane!(e) : null,
                      startActionPane: (startActionPane != null)
                          ? startActionPane!(e)
                          : null,
                      child: RentedAssetListTile(
                        e,
                        relativeTime: rental.status == RentalStatus.active,
                      ),
                    );
                  }).toList(),
                ],
              ),
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
}
