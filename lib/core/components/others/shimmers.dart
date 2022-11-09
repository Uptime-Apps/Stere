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
    var mainColor = Theme.of(context).colorScheme.surfaceVariant;
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

class ShimmeringCard extends StatelessWidget {
  const ShimmeringCard({
    this.margin,
    this.height,
    this.width,
    Key? key,
  }) : super(key: key);

  final double? height;
  final double? width;
  final EdgeInsets? margin;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: margin,
      clipBehavior: Clip.hardEdge,
      child: ShimmeringBox(height: height, width: width),
    );
  }
}
