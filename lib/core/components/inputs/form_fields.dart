import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../constants/radius_values.dart';
import '../../constants/spacing_values.dart';

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

class SelectFormField<T> extends StatelessWidget {
  const SelectFormField({
    Key? key,
    required this.items,
    required this.onChanged,
    required this.hint,
    this.icon,
    this.validator,
    this.selectedItemBuilder,
  }) : super(key: key);

  final List<DropdownMenuItem<T>> items;
  final Function(T?)? onChanged;
  final String hint;
  final String? Function(T?)? validator;
  final List<Widget> Function(BuildContext)? selectedItemBuilder;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height / 2;
    return DropdownButtonFormField2<T>(
      dropdownMaxHeight: height,
      dropdownOverButton: false,
      scrollbarAlwaysShow: true,
      scrollbarThickness: 4,
      isDense: true,
      dropdownPadding: const EdgeInsets.symmetric(vertical: kVerticalSpacing),
      dropdownDecoration: BoxDecoration(
        borderRadius: BorderRadius.circular(kInputRadius),
      ),
      items: items,
      validator: validator,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      onChanged: onChanged,
      hint: Text(hint),
      offset: Offset.fromDirection(0, 0),
      decoration: InputDecoration(prefixIcon: Icon(icon)),
      selectedItemBuilder: selectedItemBuilder,
    );
  }
}