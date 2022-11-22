import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../backend/models/status/rental_status.dart';
import '../../backend/services/rental_service.dart';
import '../../core/components/list_tiles/rental.dart';
import '../../core/components/lists/rentals_list_view.dart';

class RentalScreen extends ConsumerWidget {
  static const route = 'rentals';
  const RentalScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return RentalsListView(
      onData: (documents) => documents
          .where((element) => element.status != RentalStatus.active)
          .map((e) => RentalCard(e))
          .toList(),
      stream: ref.read(rentalServiceProvider).getOrderedByDate(),
    );
  }
}
