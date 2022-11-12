import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../backend/models/asset/asset.dart';
import '../../../../core/components/inputs/form_fields.dart';
import '../../../../core/components/others/shimmers.dart';
import '../../../../l10n/generated/l10n.dart';
import '../rental_form_controller.dart';

class StepAvailableAssets extends ConsumerWidget {
  const StepAvailableAssets(this.assetsStream, {Key? key}) : super(key: key);
  final Stream<List<Asset>>? assetsStream;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return StreamBuilder(
      builder: (context, snapshot) {
        if (snapshot.hasData && snapshot.data!.isNotEmpty) {
          var menuItems = snapshot.data!
              .map(
                (e) => DropdownMenuItem(
                  value: e,
                  child: SizedBox(
                    height: 50,
                    width: MediaQuery.of(context).size.width / 2,
                    child: ListTile(
                      visualDensity: VisualDensity.compact,
                      title: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: '${e.categoryName}: ',
                              style: DefaultTextStyle.of(context)
                                  .style
                                  .copyWith(fontWeight: FontWeight.bold),
                            ),
                            TextSpan(
                              text: e.name,
                              style: DefaultTextStyle.of(context).style,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              )
              .toList();
          return SelectFormField(
            items: menuItems,
            icon: Icons.shopping_bag,
            onChanged: (asset) => {
              ref.read(rentalFormControllerProvider.notifier).selectAsset(asset)
            },
            hint: S.of(context).lblAssets(2),
            selectedItemBuilder: (context) => snapshot.data!
                .map((e) => SizedBox(
                    width: MediaQuery.of(context).size.width / 3,
                    child: Text(e.name, overflow: TextOverflow.ellipsis)))
                .toList(),
          );
        } else {
          return const ShimmeringInput();
        }
      },
      stream: assetsStream,
    );
  }
}
