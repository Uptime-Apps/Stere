import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../backend/models/asset/asset.dart';
import '../../core/components/others/shimmers.dart';
import '../../core/constants/radius_values.dart';
import '../../core/constants/spacing_values.dart';
import 'list/asset_list_controller.dart';

class AssetScreen extends ConsumerWidget {
  static const route = 'rentals';
  const AssetScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final assets = ref.watch(assetListControllerProvider).assets;
    return (assets != null)
        ? assets.maybeWhen(
            orElse: () => Container(
                  color: Colors.red,
                ),
            data: ((stream) => StreamBuilder(
                builder: (context, snapshot) {
                  if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                    final dataList =
                        snapshot.data!.map((e) => AssetListTile(e)).toList();
                    return ListView.builder(
                      itemBuilder: (_, index) => dataList[index],
                      itemCount: dataList.length,
                      // itemExtent: MediaQuery.of(context).size.height / 3.5,
                    );
                  }
                  return const Text('Empty categories');
                },
                stream: stream)))
        : Padding(
            padding: const EdgeInsets.symmetric(horizontal: kHorizontalSpacing),
            child: ListView.builder(
              itemBuilder: ((context, index) => const ListTileSkeleton()),
              itemCount: 10,
            ));
  }
}

class AssetListTile extends StatelessWidget {
  const AssetListTile(this.asset, {super.key});
  final Asset asset;

  @override
  Widget build(BuildContext context) {
    return ListTile(title: Text(asset.name));
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
        width: 10.0,
        height: Theme.of(context).textTheme.titleMedium!.fontSize,
      ),
    );
  }
}
