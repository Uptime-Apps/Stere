import 'package:flutter/material.dart';

import '../../constants/spacing_values.dart';

class ChipsOverflowBar extends StatelessWidget {
  const ChipsOverflowBar(this.chips, {this.width, super.key});
  final List<String> chips;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? double.infinity,
      child: OverflowBar(
        spacing: kSpacing,
        children: chips.map((s) => Chip(label: Text(s))).toList(),
      ),
    );
  }
}
