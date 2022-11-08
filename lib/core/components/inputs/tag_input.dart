import 'package:flutter/material.dart';

import '../../../l10n/generated/l10n.dart';
import '../../constants/spacing_values.dart';

class TagInputField extends StatefulWidget {
  const TagInputField(
      {super.key,
      required this.onChange,
      required this.tagController,
      this.errorText});
  final Function(List<String>) onChange;
  final TextEditingController tagController;
  final String? errorText;

  @override
  _TagInputFieldState createState() => _TagInputFieldState();
}

class _TagInputFieldState extends State<TagInputField> {
  final List<String> _tags = [];
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          controller: widget.tagController,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(horizontal: kSpacing),
            errorText: widget.errorText,
            label: Text(S.of(context).lblTags),
            prefixIcon: const Icon(Icons.label),
          ),
          textInputAction: TextInputAction.send,
          maxLines: 1,
          autocorrect: true,
          onEditingComplete: () {
            setState(() {
              var text = widget.tagController.text.trim();
              if (text.isNotEmpty) {
                _tags.add(text);
                widget.tagController.clear();
                widget.onChange(_tags);
              }
            });
          },
        ),
        ...?_buildChips(),
      ],
    );
  }

  List<Widget>? _buildChips() {
    if (_tags.isNotEmpty) {
      return [
        Wrap(
          direction: Axis.horizontal,
          alignment: WrapAlignment.start,
          spacing: kChipSpacing,
          children: _tags
              .map(
                (e) => InputChip(
                  deleteIcon: const Icon(Icons.close),
                  label: Text(e),
                  onDeleted: () => setState(() {
                    _tags.remove(e);
                  }),
                ),
              )
              .toList(),
        ),
      ];
    }
    return null;
  }
}
