import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../backend/models/rental/deposit.dart';
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
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          Wrap(
            children: [
              TinyListTile(
                icon: Icons.shopping_bag,
                title: prov.chosenAsset.value!.name,
              ),
              TinyListTile(
                icon: Icons.watch_later_outlined,
                title:
                    '${prov.hoursRented.toString()} ${S.of(context).lblHours}',
              ),
              TinyListTile(
                icon: Icons.shopping_bag,
                title: prov.chosenAsset.value!.mileage.toString(),
              ),
            ],
          ),
          const Divider(),
          Wrap(
            children: [
              TinyListTile(
                icon: Icons.person,
                title: prov.clientNameController.text,
                subtitle: S.of(context).lblClientName,
              ),
              TinyListTile(
                title:
                    prov.clientDeposit.value == DepositEnum.identification.name
                        ? S.of(context).lblClientDepositIdentification
                        : S.of(context).lblClientDepositPassport,
                icon: Icons.inbox,
                subtitle: S.of(context).lblClientDeposit,
              ),
              TinyListTile(
                title: prov.clientHousingController.text,
                icon: Icons.hotel,
                subtitle: S.of(context).lblClientHousing,
              ),
              TinyListTile(
                title: prov.clientPhoneController.text,
                icon: Icons.phone,
                subtitle: S.of(context).lblClientPhone,
              ),
            ],
          ),
        ],
      ),
    );
  }

  List<Widget> renderDetails(List<String?> details) {
    return details.map((e) => Text(e ?? 'INCOMPLETE')).toList();
  }
}

class TinyListTile extends StatelessWidget {
  const TinyListTile(
      {required this.icon, required this.title, this.subtitle, Key? key})
      : super(key: key);
  final IconData icon;
  final String title;
  final String? subtitle;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return ListTile(
      leading: Icon(icon, color: colorScheme.tertiary),
      horizontalTitleGap: 0,
      dense: true,
      visualDensity: VisualDensity.compact,
      contentPadding: EdgeInsets.zero,
      title: Text(title),
      subtitle: subtitle != null ? Text(subtitle!) : null,
    );
  }
}
