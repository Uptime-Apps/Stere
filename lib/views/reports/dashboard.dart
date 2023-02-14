import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/constants/icons.dart';

class ReportDashboardScreen extends ConsumerWidget {
  const ReportDashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: const [
        ListTile(
          title: Text('Income'),
          leading: Icon(icMoney),
        ),
      ],
    );
  }
}
