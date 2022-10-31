import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../core/components/navigation/scaffold.dart';

class HomeScreen extends ConsumerWidget {
  static const route = '/';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    return StereMainScreenScaffold(
      body: Column(
        children: [
          Flexible(
            flex: 1,
            child: Container(color: theme.focusColor),
          ),
          Expanded(
            flex: 3,
            child: Container(
              color: theme.backgroundColor,
            ),
          ),
        ],
      ),
      fab: FloatingActionButton.large(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}
