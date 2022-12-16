import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../l10n/generated/l10n.dart';
import '../../constants/icons.dart';
import '../../constants/spacing_values.dart';
import '../chips/numeric_chips.dart';

class DefaultSpacer extends StatelessWidget {
  const DefaultSpacer({this.dim = kSpacing, super.key});
  final double dim;

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: dim, width: dim);
  }
}

class LinearProgressBar extends StatelessWidget {
  const LinearProgressBar({this.value, super.key});
  final double? value;

  @override
  Widget build(BuildContext context) {
    final Color color = Theme.of(context).colorScheme.secondary;
    return LinearProgressIndicator(
      value: value,
      minHeight: kProgressBarHeight,
      color: color,
      backgroundColor: color.withOpacity(0.1),
    );
  }
}

class ConfirmationDialog extends StatelessWidget {
  const ConfirmationDialog({
    Key? key,
    required this.icon,
    required this.content,
    required this.onSuccess,
    this.onCancel,
  }) : super(key: key);
  final IconData icon;
  final String content;
  final VoidCallback onSuccess;
  final VoidCallback? onCancel;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(S.of(context).msgAreYouSure),
      content: Text(content),
      actions: [
        SimpleDialogOption(
          onPressed: () {
            onCancel;
            Navigator.of(context).pop();
          },
          child: Text(S.of(context).lblCancel),
        ),
        SimpleDialogOption(
          onPressed: () {
            onSuccess();
            Navigator.of(context).pop();
          },
          child: Text(S.of(context).lblConfirm),
        ),
      ],
    );
  }
}

class TotalAmountListTile extends StatelessWidget {
  const TotalAmountListTile({
    Key? key,
    required this.total,
  }) : super(key: key);

  final double total;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const FaIcon(icMoney),
      title: Text(S.of(context).lblTotal),
      trailing: PriceChip(price: total),
    );
  }
}
