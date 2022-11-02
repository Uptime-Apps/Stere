import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/constants/icons.dart';
import '../../core/constants/spacing_values.dart';
import '../../l10n/generated/l10n.dart';

class HomeScreen extends ConsumerWidget {
  static const route = '/';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        Flexible(
          flex: 1,
          child: ListView(
            padding: const EdgeInsets.all(kCarouselPadding),
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
        Expanded(
          flex: 3,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: kContainerPadding),
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  title: Text(S.of(context).stActiveRentals),
                  leading: Icon(icRentals),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
