import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../backend/models/status/rental_status.dart';
import '../../backend/services/rental_service.dart';
import '../../core/components/cards/rental.dart';
import '../../core/components/lists/rentals_list_view.dart';
import '../../core/constants/icons.dart';
import '../../l10n/generated/l10n.dart';
import 'category_carousel/carousel.dart';

class HomeScreen extends ConsumerWidget {
  static const route = '/';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            title: Text(S.of(context).lblCategories(2)),
            leading: const Icon(icCategories),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 6,
            child: const CategoryCarousel(),
          ),
          ListTile(
            title: Text(S.of(context).stActiveRentals),
            leading: const Icon(icRentals),
          ),
          RentalsListView(
            onData: (documents) => documents
                .where((element) => element.status == RentalStatus.active)
                .map((e) => RentalCard(e))
                .toList(),
            stream: ref.read(rentalServiceProvider).getOrderedByDate(),
            noContentMessage: S.of(context).msgNoRentalsActive,
          ),
        ],
      ),
    );
  }
}
