import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../backend/models/asset/asset.dart';
import '../../../backend/models/status/rental_status.dart';
import '../../../backend/services/asset_service.dart';

class ChangeAssetStatusModalBottomSheet extends ConsumerWidget {
  const ChangeAssetStatusModalBottomSheet(this.asset, {super.key});
  final Asset asset;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var statusList = AssetStatus.values;
    return Column(
      children: statusList
          .where((element) =>
              element != asset.status && element != AssetStatus.rented)
          .map(
            (e) => ListTile(
              onTap: () {
                ref.read(assetServiceProvider).setStatus(asset.id!, e);
                Navigator.of(context).pop();
              },
              visualDensity: VisualDensity.compact,
              title: Text(e.local),
              leading: FaIcon(e.icon, color: e.color),
            ),
          )
          .toList(),
    );
  }
}
