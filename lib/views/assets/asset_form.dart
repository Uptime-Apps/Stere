import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/components/others/basic_scaffold.dart';
import '../../l10n/generated/l10n.dart';

class AssetForm extends ConsumerWidget {
  static const route = 'asset-form';
  const AssetForm({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final lang = S.of(context);
    return StereBasicScaffold(
      title: lang.lblCreateObject(lang.lblAssets(1)),
      body: const Center(child: Text('hi')),
    );
  }
}
