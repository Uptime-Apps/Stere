import 'package:flutter/material.dart';
import 'rental_asset_form.dart';

import '../../../../../backend/models/rental/rental_asset.dart';
import '../../../../../core/components/others/modal_bottom_sheet.dart';

void showEditSelectionModal(BuildContext context, RentalAsset obj, int index,
    Function(int i, RentalAsset ra) onData) async {
  var res = await showStereModalBottomSheet<RentalAsset>(
      isScrollControlled: true,
      context: context,
      title: obj.name,
      body: RentalAssetForm(obj));
  if (res != null) {
    onData(index, res);
  }
}
