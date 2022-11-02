import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../routes/navigation_controller.dart';
import '../../constants/local_files.dart';

class AppBarLogo extends ConsumerWidget {
  const AppBarLogo({
    this.color,
    Key? key,
  }) : super(key: key);
  final Color? color;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return IconButton(
      onPressed: !ref.read(navigationControllerProvider.notifier).viewIsHome()
          ? () =>
              ref.read(navigationControllerProvider.notifier).setCurrentIndex(1)
          : null,
      icon: Image.asset(
        assetLogo,
        fit: BoxFit.contain,
        color: color ?? Theme.of(context).colorScheme.onSurface,
        height: 32,
      ),
    );
  }
}
