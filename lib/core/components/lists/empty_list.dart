import 'package:flutter/material.dart';

import '../../../l10n/generated/l10n.dart';
import '../../constants/spacing_values.dart';
import '../others/filled_button.dart';
import '../others/utilities.dart';

class EmptyListScreen extends StatelessWidget {
  const EmptyListScreen(
      {required this.itemName,
      required this.icon,
      this.actionRoute,
      super.key});
  final String itemName;
  final IconData icon;
  final String? actionRoute;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: colorScheme.secondary,
            size: MediaQuery.of(context).size.height / 7,
          ),
          Text(
            S.of(context).msgNothingToSee,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const DefaultSpacer(dim: kSpacing / 4),
          Text(S.of(context).msgNoRegisters(itemName.toLowerCase())),
          const DefaultSpacer(),
          if (actionRoute != null)
            FilledButton(
              label: Text(S.of(context).lblCreateNew),
              onPressed: () => Navigator.of(context).pushNamed(actionRoute!),
            )
        ],
      ),
    );
  }
}
