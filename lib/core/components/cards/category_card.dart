import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shimmer/shimmer.dart';

import '../../../backend/models/category/category.dart';
import '../../../views/home/home_controller.dart';

class CategoryCard extends ConsumerWidget {
  const CategoryCard(this.category, {Key? key, this.width}) : super(key: key);
  final Category? category;
  final double? width;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return (category != null) ? card(ref) : skeleton();
  }

  Widget skeleton() {
    return Card(
      margin: EdgeInsets.zero,
      child: ShimmeringBox(height: width, width: width),
    );
  }

  Widget card(WidgetRef ref) {
    final imagePath = ref.watch(homeCategoryImageProvider(category!));
    return imagePath.when(
      data: (data) => Container(),
      loading: () => ShimmeringBox(width: width),
      error: (_, stackTrace) => ShimmeringBox(width: width),
    );
  }
}

class DefaultImageCard extends StatelessWidget {
  const DefaultImageCard({this.width, this.height, super.key});
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return const Card(child: Text('dfimgc'));
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
