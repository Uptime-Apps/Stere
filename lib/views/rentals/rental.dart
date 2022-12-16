import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../backend/models/rental/rental.dart';
import '../../backend/models/rental/rental_asset.dart';
import '../../backend/models/status/rental_status.dart';
import '../../backend/services/rental_service.dart';
import '../../core/components/cards/rental.dart';
import '../../core/components/lists/stream_list_view.dart';
import '../../core/components/others/utilities.dart';
import '../../core/constants/icons.dart';
import '../../l10n/generated/l10n.dart';
import 'form/rental_form.dart';

class RentalScreen extends ConsumerWidget {
  static const route = 'rentals';
  const RentalScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return StreamListView<Rental>(
      onData: (documents) {
        if (documents?.isNotEmpty ?? false) {
          return documents!
              .where((element) => element.status != RentalStatus.active)
              .map((e) => RentalCard(e))
              .toList();
        }
        return null;
      },
      stream: ref.read(rentalServiceProvider).getOrderedByDate(),
      headerBuilder: (context, snapshot) {
        final data = snapshot.value;
        double total = 0;
        List<RentalAsset> prices = [];
        if (data != null) {
          (data.length > 1)
              ? snapshot.value?.forEach((r) => prices.addAll(r.assets))
              : prices = data.first.assets;
        }
        return (total > 0)
            ? TotalAmountListTile(total: total)
            : const SizedBox.shrink();
      },
      noContentMessage: S
          .of(context)
          .msgNothingAvailable(S.of(context).lblRentals(2).toLowerCase()),
      noContentIcon: icRentals,
      noContentActionRoute: RentalForm.route,
    );
  }
}
