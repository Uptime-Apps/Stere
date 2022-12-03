import 'package:flutter/material.dart';

import '../../constants/radius_values.dart';
import '../../constants/spacing_values.dart';

Future<T?> showStereModalBottomSheet<T>({
  required BuildContext context,
  required String title,
  required Widget body,
  String? subtitle,
  bool isScrollControlled = false,
  EdgeInsets? padding = const EdgeInsets.symmetric(
      horizontal: kHorizontalSpacing, vertical: kVerticalSpacing),
}) {
  final theme = Theme.of(context);
  final textTheme = theme.textTheme;
  return showModalBottomSheet(
    isScrollControlled: isScrollControlled,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(kCardRadius),
    ),
    context: context,
    builder: (context) => SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: padding ?? EdgeInsets.zero,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: textTheme.headlineSmall,
                ),
                if (subtitle != null)
                  Text(subtitle, style: textTheme.subtitle1),
                body,
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
