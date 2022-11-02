import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/components/others/basic_scaffold.dart';

class CategoryForm extends ConsumerWidget {
  static const route = 'category-form';
  const CategoryForm({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const StereBasicScaffold(
      body: Center(child: Text('hi')),
    );
  }
}
