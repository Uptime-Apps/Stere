import 'package:flutter/material.dart';

import '../../constants/spacing_values.dart';

class ChipsOverflowBar extends StatelessWidget {
  const ChipsOverflowBar(this.chips, {super.key});
  final List<String> chips;

  @override
  Widget build(BuildContext context) {
    return OverflowBar(
      spacing: kSpacing,
      children: chips.map((s) => ActionChip(label: Text(s))).toList(),
    );
  }
}
