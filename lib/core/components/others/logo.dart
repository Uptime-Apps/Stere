import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../routes/navigation_controller.dart';
import '../../../views/home.dart';
import '../../constants/local_files.dart';

class AppBarLogo extends ConsumerWidget {
  const AppBarLogo({
    this.color,
    Key? key,
  }) : super(key: key);
  final Color? color;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var route = HomeScreen.route;
    return IconButton(
      onPressed: (ref.watch(navigationControllerProvider).currentRoute != route)
          ? () {
              ref
                  .read(navigationControllerProvider.notifier)
                  .pushReplacement(context, route);
            }
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
