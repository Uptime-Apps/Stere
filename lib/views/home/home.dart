import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/constants/icons.dart';
import '../../core/constants/spacing_values.dart';
import '../../l10n/generated/l10n.dart';
import 'category_carousel/carousel.dart';

class HomeScreen extends ConsumerWidget {
  static const route = '/';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        ListTile(
          title: Text(S.of(context).lblCategories(2)),
          leading: Icon(icCategories),
        ),
        const Flexible(
          flex: 1,
          child: CategoryCarousel(),
        ),
        Expanded(
          flex: 3,
          child: SizedBox(
            // padding: const EdgeInsets.symmetric(horizontal: kContainerPadding),
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
