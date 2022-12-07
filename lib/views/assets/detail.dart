import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../backend/models/asset/asset.dart';
import '../../backend/models/status/rental_status.dart';
import '../../core/components/others/basic_scaffold.dart';
import '../../core/components/others/shimmers.dart';
import '../../core/components/others/utilities.dart';
import '../../core/constants/image_assets.dart';
import '../../core/constants/radius_values.dart';
import '../../core/constants/spacing_values.dart';
import 'form/asset_form_controller.dart';

class AssetDetailScreen extends ConsumerWidget {
  static const route = 'asset-detail-screen';
  const AssetDetailScreen(this.asset, {super.key});
  final Asset asset;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Image defaultImage = Image.asset(
      iaDefaultCategoryImage,
      width: double.infinity,
      fit: BoxFit.cover,
    );
    return StereBasicScaffold(
      body: Flex(
        mainAxisSize: MainAxisSize.max,
        direction: Axis.vertical,
        children: [
          Flexible(
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(kCardRadius),
              ),
              clipBehavior: Clip.hardEdge,
              child: (asset.imagePath != null)
                  ? ref.watch(assetImageProvider(asset.imagePath!)).when(
                        data: (data) => (data != null)
                            ? CachedNetworkImage(
                                imageUrl: data,
                                fit: BoxFit.cover,
                                width: double.infinity,
                                placeholder: (_, __) => const LoadingSkeleton(
                                    progressBar: LinearProgressBar()),
                              )
                            : defaultImage,
                        loading: () => const LoadingSkeleton(
                          progressBar: LinearProgressBar(),
                        ),
                        error: (_, stackTrace) {
                          log(stackTrace.toString(), name: route);
                          return Container();
                        },
                      )
                  : defaultImage,
            ),
          ),
          Expanded(
            flex: 3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                ListTile(
                    title: Text(
                      asset.status.local,
                    ),
                    dense: false,
                    visualDensity: VisualDensity.comfortable,
                    subtitle: Text(asset.categoryName),
                    trailing:
                        Icon(asset.status.icon, color: asset.status.color)),
                if (asset.tags?.isNotEmpty ?? false) tagsSection(),
              ],
            ),
          ),
        ],
      ),
      title: asset.name,
    );
  }

  Widget tagsSection() {
    var tags = asset.tags!
        .map((e) => Chip(
              label: Text(e),
            ))
        .toList();
    return SizedBox(
      width: double.infinity,
      child: Wrap(
        spacing: kSpacing / 2,
        alignment: WrapAlignment.start,
        runAlignment: WrapAlignment.start,
        crossAxisAlignment: WrapCrossAlignment.start,
        clipBehavior: Clip.hardEdge,
        children: tags,
      ),
    );
  }
}
