import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../backend/models/asset/asset.dart';
import '../../../backend/models/status/rental_status.dart';
import '../../../l10n/generated/l10n.dart';
import '../../constants/spacing_values.dart';
import '../others/modal_bottom_sheet.dart';
import 'change_asset_status.dart';

class AssetStatusIconButton extends StatelessWidget {
  const AssetStatusIconButton({
    Key? key,
    required this.asset,
  }) : super(key: key);

  final Asset asset;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      tooltip: asset.status.local,
      icon: FaIcon(asset.status.icon),
      color: asset.status.color,
      onPressed: () async {
        if (asset.status != AssetStatus.rented) {
          showStereModalBottomSheet<Asset>(
            context: context,
            body: ChangeAssetStatusModalBottomSheet(asset),
            subtitle: S.of(context).msgCurrentStatus(asset.status.local),
            title: S.of(context).stChangeStatus,
          );
        } else {
          showDialog(
            context: context,
            builder: (context) => SimpleDialog(
              contentPadding: kDialogContentPadding,
              title: Text(S.of(context).msgNotAllowed),
              children: [Text(S.of(context).msgUnableToChangeStatus)],
            ),
          );
        }
      },
    );
  }
}
