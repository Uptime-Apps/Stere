import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/components/lists/chips.dart';
import '../../core/components/others/utilities.dart';
import '../../core/constants/icons.dart';
import '../../core/constants/spacing_values.dart';

class RentalScreen extends ConsumerWidget {
  static const route = 'rentals';
  const RentalScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;

    return ListView.separated(
      padding: const EdgeInsets.all(kSpacing),
      itemCount: 10,
      itemBuilder: ((context, index) {
        return Card(
          elevation: 0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                leading: CircleAvatar(
                    backgroundColor: colorScheme.primary,
                    foregroundColor: colorScheme.onPrimary,
                    child: const Icon(Icons.person)),
                title: const Text('Category.name'),
                subtitle: const Text('Rental.clientName'),
                trailing: CircleAvatar(
                    backgroundColor: colorScheme.background,
                    foregroundColor: colorScheme.onBackground,
                    child: const Icon(icRenatlDone)),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: kSpacing, right: kSpacing, bottom: kCardSpacing),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const ChipsOverflowBar(['asdf', '92jejasdf']),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {},
                        child: const Text('More details'),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      }),
      separatorBuilder: (context, index) =>
          const DefaultSpacer(dim: kCardSpacing),
    );
  }
}
