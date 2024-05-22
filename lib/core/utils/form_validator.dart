import 'package:so_boleto/core/l10n/generated/l10n.dart';

abstract class FormValidator {
  static String? validatePinCodeDigit(String? digit) =>
      _validateIsNullOrEmpty(digit);

  static String? _validateIsNullOrEmpty(String? fieldValue,
          {String? fieldName}) =>
      fieldValue == null || fieldValue.isEmpty
          ? 'Invalid ${fieldName ?? 'field'}. It can\'t be empty'
          : null;

  static String? validateMsisdn(String? msisdn) {
    var error = _validateIsNullOrEmpty(
      msisdn,
      fieldName: 'Number',
    );

    if (error != null) {
      return error;
    }

    if (msisdn!.length < 11) {
      error = 'Invalid msisdn';
    }

    return error;
  }

  static String? validateEmailField(String? fieldValue) => fieldValue == null ||
          !RegExp(
            r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
          ).hasMatch(fieldValue)
      ? AppLocalizations.current.validatorEmail
      : null;
}
