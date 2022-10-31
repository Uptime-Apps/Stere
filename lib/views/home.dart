import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../core/components/navigation/scaffold.dart';
import '../core/constants/spacing_values.dart';
import '../l10n/generated/l10n.dart';

class HomeScreen extends ConsumerWidget {
  static const route = '/';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return StereMainScreenScaffold(
      fab: FloatingActionButton.extended(
        label: Text(S.of(context).lblCreateObject(S.of(context).lblRentals(1))),
        onPressed: () {},
        icon: const Icon(Icons.add),
      ),
      body: Column(
        children: [
          Flexible(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(kCarouselPadding),
              child: ListView(
                scrollDirection: Axis.horizontal,
                itemExtent: MediaQuery.of(context).size.width / 2.7,
                clipBehavior: Clip.none,
                children: const [
                  Card(
                    child: Text('demo'),
                  ),
                  Card(
                    child: Text('demo'),
                  ),
                  Card(
                    child: Text('demo'),
                  ),
                  Card(
                    child: Text('demo'),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Column(
              children: const [Text('Rental')],
            ),
          ),
        ],
      ),
    );
  }
}
