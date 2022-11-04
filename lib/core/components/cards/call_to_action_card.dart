import 'package:flutter/material.dart';

import '../../constants/spacing_values.dart';
import '../others/filled_button.dart';

class CallToActionCard extends StatelessWidget {
  const CallToActionCard(
      {required this.msg, this.onPressed, this.actionLabel, super.key});
  final String msg;
  final String? actionLabel;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(vertical: kContainerPadding),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(msg),
            const SizedBox(height: kCarouselPadding),
            if (onPressed != null && actionLabel != null)
              FilledButton(
                onPressed: onPressed,
                label: Text(actionLabel!),
              ),
          ],
        ),
      ),
    );
  }
}
