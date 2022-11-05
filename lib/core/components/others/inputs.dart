import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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

class NumericInputField extends StatelessWidget {
  const NumericInputField({
    Key? key,
    required this.controller,
    this.errorText,
    this.label,
    this.validator,
    this.onChanged,
    this.onEditingComplete,
    this.icon,
    this.textInputAction,
  }) : super(key: key);

  final String? errorText;
  final String? label;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final String? Function(String?)? onChanged;
  final void Function()? onEditingComplete;
  final IconData? icon;
  final TextInputAction? textInputAction;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      controller: controller,
      textInputAction: textInputAction,
      maxLines: 1,
      keyboardType:
          const TextInputType.numberWithOptions(decimal: true, signed: false),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
        prefixIcon: Icon(icon),
        errorText: errorText,
        label: label != null ? Text(label!) : null,
      ),
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      validator: validator,
      onEditingComplete: onEditingComplete,
    );
  }
}

class MoneyInputField extends StatelessWidget {
  const MoneyInputField({
    Key? key,
    required this.controller,
    this.errorText,
    this.label,
    this.validator,
  }) : super(key: key);

  final String? errorText;
  final String? label;
  final TextEditingController controller;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      textInputAction: TextInputAction.next,
      maxLines: 1,
      keyboardType:
          const TextInputType.numberWithOptions(decimal: true, signed: false),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.attach_money),
        errorText: errorText,
        label: label != null ? Text(label!) : null,
      ),
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      validator: validator,
    );
  }
}

class TextInputField extends StatelessWidget {
  const TextInputField({
    Key? key,
    required this.controller,
    this.errorText,
    this.label,
    this.validator,
    this.textInputAction,
    this.icon,
    this.onEditingComplete,
    this.maxLines = 1,
  }) : super(key: key);

  final String? errorText;
  final String? label;
  final TextInputAction? textInputAction;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final IconData? icon;
  final void Function()? onEditingComplete;
  final int maxLines;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      textInputAction: textInputAction,
      maxLines: maxLines,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
        prefixIcon: Icon(icon),
        errorText: errorText,
        label: label != null ? Text(label!) : null,
      ),
      validator: validator,
      onEditingComplete: onEditingComplete,
    );
  }
}
