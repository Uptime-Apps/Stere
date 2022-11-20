import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../backend/services/rental_service.dart';
import '../../../l10n/generated/l10n.dart';
import '../../../views/rentals/form/rental_form.dart';
import '../../constants/icons.dart';
import '../../constants/spacing_values.dart';
import '../list_tiles/rental.dart';
import '../others/utilities.dart';
import 'empty_list.dart';

class RentalsListView extends ConsumerWidget {
  const RentalsListView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FutureBuilder(
      builder: ((context, snapshot) {
        if (snapshot.data?.isNotEmpty ?? false) {
          final activeRentals =
              snapshot.data!.map((e) => RentalCard(e)).toList();
          return Padding(
            padding: const EdgeInsets.all(kHorizontalSpacing),
            child: ListView.separated(
              itemBuilder: (_, i) => activeRentals[i],
              separatorBuilder: (_, __) => const DefaultSpacer(),
              itemCount: activeRentals.length,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
            ),
          );
        }
        return SizedBox(
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
      }),
      future: ref.read(rentalServiceProvider).getActive(),
    );
  }
}
