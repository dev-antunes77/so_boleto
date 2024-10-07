import 'package:so_boleto/core/extensions/string_extensions.dart';
import 'package:so_boleto/core/utils/system_overlay_utils.dart';

class CapitalizeInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }

    return newValue.copyWith(text: newValue.text.capitalize());
  }
}
