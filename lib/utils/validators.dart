import '../l10n/generated/l10n.dart';

String? requiredFieldValidation(String? value) =>
    (value == null || value.isEmpty) ? S.current.emFieldRequired : null;
