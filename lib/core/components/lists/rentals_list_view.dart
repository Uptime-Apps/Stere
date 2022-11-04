import 'package:flutter/material.dart';

import '../../../l10n/generated/l10n.dart';
import '../../../views/rentals/rental_form.dart';
import '../../constants/spacing_values.dart';
import '../cards/call_to_action_card.dart';

class RentalsListView extends StatelessWidget {
  const RentalsListView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String Function(num isPlural) rentalsText = S.of(context).lblRentals;
    return SizedBox(
      // padding: const EdgeInsets.symmetric(horizontal: kContainerPadding),
      width: double.infinity,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(kContainerPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: CallToActionCard(
                    msg: S.of(context).emNoObjectsRegistered(rentalsText(2)),
                    actionLabel: S.of(context).lblCreateObject(rentalsText(1)),
                    onPressed: () =>
                        Navigator.of(context).pushNamed(RentalForm.route)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
