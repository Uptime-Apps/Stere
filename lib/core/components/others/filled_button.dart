import 'package:flutter/material.dart';
import '../../constants/radius_values.dart';

class FilledButton extends StatelessWidget {
  const FilledButton({
    Key? key,
    this.onPressed,
    this.width,
    required this.label,
  }) : super(key: key);
  final VoidCallback? onPressed;
  final double? width;
  final Widget label;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: colorScheme.primary,
          foregroundColor: colorScheme.onPrimary,
          // fixedSize: const Size.fromHeight(40),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(kFilledButtonRadius))),
      child: Container(
        width: width,
        // alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: label,
      ),
    );
  }
}

class FilledButtonCircularProgressIndicator extends StatelessWidget {
  const FilledButtonCircularProgressIndicator({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: CircularProgressIndicator(
        color: Theme.of(context).colorScheme.onPrimary,
        strokeWidth: 2,
      ),
    );
  }
}
