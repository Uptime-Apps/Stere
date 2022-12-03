import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../backend/models/rental/rental.dart';
import '../../../views/rentals/form/rental_form.dart';
import '../../constants/icons.dart';
import '../../constants/spacing_values.dart';
import 'empty_list.dart';

class RentalsListView extends ConsumerWidget {
  const RentalsListView({
    required this.stream,
    required this.onData,
    required this.noContentMessage,
    Key? key,
  }) : super(key: key);
  final Stream<List<Rental>>? stream;
  final String noContentMessage;
  final List<Widget> Function(List<Rental>) onData;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return StreamBuilder(
      builder: ((context, snapshot) {
        if (snapshot.data?.isNotEmpty ?? false) {
          final res = onData(snapshot.data!);
          if (res.isEmpty) {
            return Center(
              child: EmptyListScreen(
                message: noContentMessage,
                icon: icRentals,
                actionRoute: RentalForm.route,
              ),
            );
          }
          return Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: kHorizontalSpacing, vertical: kVerticalSpacing),
            child: ListView.builder(
              itemBuilder: (_, i) => res[i],
              // separatorBuilder: (_, __) => const Divider(),
              itemCount: res.length,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
            ),
          );
        }
        return Center(
          child: EmptyListScreen(
            message: noContentMessage,
            icon: icRentals,
            actionRoute: RentalForm.route,
          ),
        );
      }),
      stream: stream,
    );
  }
}
