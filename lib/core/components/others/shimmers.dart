import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'utilities.dart';

import '../../constants/others.dart';
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
    final colorScheme = Theme.of(context).colorScheme;
    return Shimmer.fromColors(
      baseColor: colorScheme.surfaceVariant,
      highlightColor: colorScheme.surfaceVariant.withOpacity(0.6),
      period: const Duration(milliseconds: kShimmerDuration),
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

class LinearLoadingSkeleton extends StatelessWidget {
  const LinearLoadingSkeleton({
    this.progress,
    Key? key,
  }) : super(key: key);
  final double? progress;

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.hardEdge,
      child: LoadingSkeleton(
        progressBar:
            (progress != null) ? LinearProgressBar(value: progress!) : null,
      ),
    );
  }
}

class CircularLoadingSkeleton extends StatelessWidget {
  const CircularLoadingSkeleton({
    this.progress,
    Key? key,
  }) : super(key: key);
  final double? progress;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(50),
      clipBehavior: Clip.antiAlias,
      child: CircleAvatar(
        backgroundColor: Colors.transparent,
        child: LoadingSkeleton(
          alignment: Alignment.center,
          progressBar: (progress != null)
              ? CircularProgressIndicator(
                  strokeWidth: 2,
                  value: progress!,
                )
              : null,
        ),
      ),
    );
  }
}

class LoadingSkeleton extends StatelessWidget {
  const LoadingSkeleton(
      {this.progressBar, this.alignment = Alignment.bottomCenter, super.key});
  final Widget? progressBar;
  final AlignmentGeometry alignment;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => SizedBox(
        height: constraints.maxHeight,
        child: Stack(
          alignment: alignment,
          children: [
            ShimmeringBox(
              height: constraints.maxHeight,
              width: constraints.maxWidth,
            ),
            if (progressBar != null) progressBar!,
          ],
        ),
      ),
    );
  }
}
