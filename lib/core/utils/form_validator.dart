import 'package:so_boleto/core/l10n/generated/l10n.dart';

abstract class FormValidator {
  static String? validateNames(String? field) =>
      field!.isEmpty || field.length < 2
          ? AppLocalizations.current.validatorEmail
          : null;

  static String? validateEmailField(String? fieldValue) => fieldValue == null ||
          !RegExp(
            r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
          ).hasMatch(fieldValue)
      ? AppLocalizations.current.validatorEmail
      : null;
}
