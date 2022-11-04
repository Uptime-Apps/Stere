import 'package:flutter/material.dart';

import '../../constants/spacing_values.dart';

class DefaultSpacer extends StatelessWidget {
  const DefaultSpacer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox(height: kSpacing, width: kSpacing);
  }
}
