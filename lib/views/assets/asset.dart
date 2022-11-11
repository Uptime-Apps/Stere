import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/components/others/shimmers.dart';
import '../../core/constants/radius_values.dart';
import '../../core/constants/spacing_values.dart';

class AssetScreen extends ConsumerWidget {
  static const route = 'rentals';
  const AssetScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: kHorizontalSpacing),
        child: ListView.builder(
          itemBuilder: ((context, index) => const ListTileSkeleton()),
          itemCount: 10,
        ));
  }
}

class ListTileSkeleton extends StatelessWidget {
  const ListTileSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return const ListTile(
      leading: CircularLoadingSkeleton(),
      title: ListTileTextSkeleton(),
      subtitle: ListTileTextSkeleton(),
    );
  }
}

class ListTileTextSkeleton extends StatelessWidget {
  const ListTileTextSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(kInputRadius),
      child: ShimmeringBox(
        height: Theme.of(context).textTheme.titleMedium!.fontSize,
      ),
    );
  }
}
