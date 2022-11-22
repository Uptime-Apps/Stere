import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../backend/models/rental/rental.dart';
import '../../../l10n/generated/l10n.dart';
import '../../../views/rentals/form/rental_form.dart';
import '../../constants/icons.dart';
import '../../constants/spacing_values.dart';
import '../others/utilities.dart';
import 'empty_list.dart';

class RentalsListView extends ConsumerWidget {
  const RentalsListView({
    required this.stream,
    required this.onData,
    Key? key,
  }) : super(key: key);
  final Stream<List<Rental>>? stream;
  final List<Widget> Function(List<Rental>) onData;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return StreamBuilder(
      builder: ((context, snapshot) {
        if (snapshot.data?.isNotEmpty ?? false) {
          final res = onData(snapshot.data!);
          if (res.isEmpty) {
            return EmptyListScreen(
              message: S.of(context).msgNoRentalsActive,
              icon: icRentals,
              actionRoute: RentalForm.route,
            );
          }
          return Padding(
            padding: const EdgeInsets.all(kHorizontalSpacing),
            child: ListView.separated(
              itemBuilder: (_, i) => res[i],
              separatorBuilder: (_, __) => const DefaultSpacer(),
              itemCount: res.length,
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
                    message: S.of(context).lblRentals(2),
                    icon: icRentals,
                    actionRoute: RentalForm.route,
                  )
                ],
              ),
            ),
          ),
        );
      }),
      stream: stream,
    );
  }
}
