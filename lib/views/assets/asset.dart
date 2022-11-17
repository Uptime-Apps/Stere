import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/components/list_tiles/asset.dart';
import '../../core/components/lists/empty_list.dart';
import '../../core/components/others/shimmers.dart';
import '../../core/constants/spacing_values.dart';
import '../../l10n/generated/l10n.dart';
import 'form/asset_form.dart';
import 'list/asset_list_controller.dart';

class AssetScreen extends ConsumerWidget {
  static const route = 'assets';
  const AssetScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final assets = ref.watch(assetListControllerProvider).assets;
    return (assets != null)
        ? assets.maybeWhen(
            orElse: () => Container(
              color: Colors.red,
              child: Text(S.of(context).emServerError),
            ),
            data: ((future) => FutureBuilder(
                builder: (context, snapshot) {
                  // If there's data to show
                  if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                    final dataList =
                        snapshot.data!.map((e) => AssetListTile(e)).toList();
                    return ListView.builder(
                      itemBuilder: (_, index) => dataList[index],
                      itemCount: dataList.length,
                      // itemExtent: MediaQuery.of(context).size.height / 3.5,
                    );
                  }
                  // If the future has no data
                  return EmptyListScreen(
                    itemName: S.of(context).lblAssets(2),
                    icon: Icons.add_shopping_cart_sharp,
                    actionRoute: AssetForm.route,
                  );
                },
                future: future)),
            loading: () => Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: kHorizontalSpacing),
              child: ListView.builder(
                itemBuilder: ((context, index) => const ListTileSkeleton()),
                itemCount: 10,
              ),
            ),
          )
        : Text(S.of(context).emServerError);
  }
}
