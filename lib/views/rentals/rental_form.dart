import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/components/others/basic_scaffold.dart';
import '../../l10n/generated/l10n.dart';

class RentalForm extends ConsumerWidget {
  static const route = 'rental-form';
  const RentalForm({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final lang = S.of(context);
    return StereBasicScaffold(
      title: lang.lblCreateObject(lang.lblRentals(1)),
      body: const Center(child: Text('hi')),
    );
  }
}
