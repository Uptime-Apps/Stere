import 'package:flutter/material.dart';

import '../../../l10n/generated/l10n.dart';
import '../../constants/radius_values.dart';

class PriceChip extends StatelessWidget {
  const PriceChip({
    Key? key,
    required this.price,
  }) : super(key: key);

  final double price;

  @override
  Widget build(BuildContext context) {
    return RawChip(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(kChipRadius),
        side: BorderSide.none,
      ),
      label: Text(
        S.of(context).priceFormat(price),
        style: TextStyle(
            color: Theme.of(context).colorScheme.onSecondaryContainer),
      ),
      backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
    );
  }
}
