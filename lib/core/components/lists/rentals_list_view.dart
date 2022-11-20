import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../backend/models/rental/deposit.dart';
import '../../../backend/services/rental_service.dart';
import '../../../l10n/generated/l10n.dart';
import '../../../views/rentals/form/rental_form.dart';
import '../../constants/icons.dart';
import '../../constants/spacing_values.dart';
import '../list_tiles/asset.dart';
import '../others/utilities.dart';
import 'empty_list.dart';

class RentalsListView extends ConsumerWidget {
  const RentalsListView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    return FutureBuilder(
      builder: ((context, snapshot) {
        if (snapshot.data?.isNotEmpty ?? false) {
          final activeRentals = snapshot.data!
              .map(
                (e) => Card(
                  clipBehavior: Clip.hardEdge,
                  child: Column(
                    children: [
                      ListTile(
                        title: Text(e.clientName),
                        subtitle: Text(DateFormat.yMMMEd()
                            .format(e.creationDate)
                            .toString()),
                        visualDensity: VisualDensity.standard,
                      ),
                      DetailsExpansionTile(
                        leading: const Icon(Icons.contact_page),
                        title: const Text('Contact Details'),
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: kHorizontalSpacing),
                            child: Table(
                              defaultVerticalAlignment:
                                  TableCellVerticalAlignment.middle,
                              children: [
                                buildRow(
                                    S.of(context).lblClientDeposit,
                                    e.clientDeposit ==
                                            DepositEnum.identification.name
                                        ? S
                                            .of(context)
                                            .lblClientDepositIdentification
                                        : S
                                            .of(context)
                                            .lblClientDepositPassport,
                                    textTheme),
                                buildRow(S.of(context).lblClientId, e.clientId,
                                    textTheme),
                                buildRow(S.of(context).lblClientHousing,
                                    e.clientHousing, textTheme),
                                buildRow(S.of(context).lblClientPhone,
                                    e.clientPhone, textTheme),
                                buildRow(
                                    S.of(context).lblClientBackupPhone,
                                    e.backupPhone ??
                                        S.of(context).lblNotAvailable,
                                    textTheme),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const Divider(
                        height: 2,
                      ),
                      DetailsExpansionTile(
                        leading: Tooltip(
                            message:
                                '${e.assets.length.toString()} ${S.of(context).lblAssets(e.assets.length)}',
                            child: Badge(
                              badgeContent: Text(
                                e.assets.length.toString(),
                                style: TextStyle(
                                  color: colorScheme.onErrorContainer,
                                ),
                              ),
                              badgeColor: colorScheme.errorContainer,
                              child: const Icon(icAssets),
                            )),
                        title: const Text('Asset Details'),
                        children: e.assets
                            .map((e) => RentedAssetListTile(e))
                            .toList(),
                      ),
                    ],
                  ),
                ),
              )
              .toList();
          return Padding(
            padding: const EdgeInsets.all(kHorizontalSpacing),
            child: ListView.separated(
              itemBuilder: (_, i) => activeRentals[i],
              separatorBuilder: (_, __) => const DefaultSpacer(),
              itemCount: activeRentals.length,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
            ),
          );
        }
        return oldBuild(context);
      }),
      future: ref.read(rentalServiceProvider).getActive(),
    );
  }

  TableRow buildRow(String label, String value, TextTheme theme) =>
      TableRow(children: [
        Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: kSpacing / 2, vertical: kSpacing / 4),
            child: Text(label,
                textAlign: TextAlign.start,
                style: theme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ))),
        Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: kSpacing / 2, vertical: kSpacing / 4),
            child: Text(value, textAlign: TextAlign.end)),
      ]);

  Widget oldBuild(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(kSpacing),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              EmptyListScreen(
                itemName: S.of(context).lblRentals(2),
                icon: icRentals,
                actionRoute: RentalForm.route,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class DetailsExpansionTile extends StatelessWidget {
  const DetailsExpansionTile({
    this.leading,
    required this.title,
    required this.children,
    Key? key,
  }) : super(key: key);

  final Widget title;
  final Widget? leading;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Theme(
      data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
      child: ExpansionTile(
        leading: leading,
        title: title,
        iconColor: colorScheme.onSurface,
        textColor: colorScheme.onSurface,
        backgroundColor: colorScheme.surface,
        // collapsedIconColor: colorScheme.secondary,
        children: children,
      ),
    );
  }
}
