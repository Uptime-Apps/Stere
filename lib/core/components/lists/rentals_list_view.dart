import 'package:flutter/material.dart';

import '../../../l10n/generated/l10n.dart';
import '../../../views/rentals/rental_form.dart';
import '../../constants/icons.dart';
import '../../constants/spacing_values.dart';
import 'empty_list.dart';

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
          padding: const EdgeInsets.all(kSpacing),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              EmptyListScreen(
                itemName: S.of(context).lblRentals(2),
                icon: icRentals,
                actionRoute: RentalForm.route,
              )
            ],
          ),
        ),
      ),
    );
  }
}
