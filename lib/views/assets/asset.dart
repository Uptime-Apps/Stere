import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/constants/icons.dart';
import '../../core/constants/spacing_values.dart';
import '../../l10n/generated/l10n.dart';

class AssetScreen extends ConsumerWidget {
  static const route = 'rentals';
  const AssetScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
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
