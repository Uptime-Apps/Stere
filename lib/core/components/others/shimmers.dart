import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../constants/radius_values.dart';

class ShimmeringInput extends StatelessWidget {
  const ShimmeringInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(kInputRadius),
      child: const ShimmeringBox(height: 50, width: double.infinity),
    );
  }
}

class ShimmeringBox extends StatelessWidget {
  const ShimmeringBox({Key? key, this.height, this.width}) : super(key: key);
  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final mainColor = (Theme.of(context).brightness == Brightness.light)
        ? colorScheme.surfaceVariant
        : colorScheme.onSurfaceVariant;
    return Shimmer.fromColors(
      baseColor: mainColor,
      highlightColor: mainColor.withOpacity(0.6),
      child: Container(
        color: Colors.white,
        height: height ?? double.infinity,
        width: width ?? double.infinity,
      ),
    );
  }
}
