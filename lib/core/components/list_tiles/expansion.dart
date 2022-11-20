import 'package:flutter/material.dart';

class DetailsExpansionTile extends StatelessWidget {
  const DetailsExpansionTile({
    this.leading,
    required this.title,
    required this.children,
    Key? key,
  }) : super(key: key);

  final Widget title;
  final Widget? leading;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Theme(
      data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
      child: ExpansionTile(
        leading: leading,
        title: title,
        iconColor: colorScheme.onSurface,
        textColor: colorScheme.onSurface,
        backgroundColor: colorScheme.surface,
        // collapsedIconColor: colorScheme.secondary,
        children: children,
      ),
    );
  }
}
