import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../backend/services/rental_service.dart';
import '../../core/components/list_tiles/rental.dart';
import '../../core/components/lists/empty_list.dart';
import '../../core/components/others/utilities.dart';
import '../../core/constants/icons.dart';
import '../../core/constants/spacing_values.dart';
import '../../l10n/generated/l10n.dart';
import 'form/rental_form.dart';

class RentalScreen extends ConsumerWidget {
  static const route = 'rentals';
  const RentalScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FutureBuilder(
      builder: (context, snapshot) {
        if (snapshot.hasData && snapshot.data!.isNotEmpty) {
          final rentals = snapshot.data!;
          return ListView.separated(
            padding: const EdgeInsets.all(kSpacing),
            itemCount: rentals.length,
            itemBuilder: ((context, index) {
              return RentalCard(rentals[index]);
            }),
            separatorBuilder: (context, index) =>
                const DefaultSpacer(dim: kCardSpacing),
          );
        }
        return EmptyListScreen(
          itemName: S.of(context).lblRentals(2),
          icon: icRentals,
          actionRoute: RentalForm.route,
        );
      },
      future: ref.watch(rentalServiceProvider).getAll(),
    );
  }
}
