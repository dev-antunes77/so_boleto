import 'package:so_boleto/core/l10n/generated/l10n.dart';

abstract class FormValidator {
  static String? validateNames(String? name) => name!.isEmpty || name.length < 2
      ? AppLocalizations.current.validatorEmail
      : null;

  static String? validateEmailField(String? fieldValue) => fieldValue == null ||
          !RegExp(
            r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
          ).hasMatch(fieldValue)
      ? AppLocalizations.current.validatorEmail
      : null;

  static String? validatePassword(String? password) {
    if (password!.length < 6) {
      return null;
    }
    if (!password.contains(RegExp(r'[A-Z]'))) {
      return null;
    }
    if (!password.contains(RegExp(r'[a-z]'))) {
      return null;
    }
    if (!password.contains(RegExp(r'[0-9]'))) {
      return null;
    }
    return AppLocalizations.current.validatorEmail;
  }
}
