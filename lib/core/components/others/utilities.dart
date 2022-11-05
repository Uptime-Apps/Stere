import 'package:flutter/material.dart';

import '../../../l10n/generated/l10n.dart';
import '../../constants/spacing_values.dart';

class DefaultSpacer extends StatelessWidget {
  const DefaultSpacer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox(height: kSpacing, width: kSpacing);
  }
}

class LinearProgressBar extends StatelessWidget {
  const LinearProgressBar({this.value, super.key});
  final double? value;

  @override
  Widget build(BuildContext context) {
    return LinearProgressIndicator(
      value: value,
      minHeight: kProgressBarHeight,
      color: Theme.of(context).colorScheme.secondary,
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
