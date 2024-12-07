import 'package:so_boleto/core/constants/app_constants.dart';
import 'package:so_boleto/core/l10n/generated/l10n.dart';

extension IntExtensions on int {
  String addLeadingZero() {
    if (this <= -10 && this >= 10) {
      return toString();
    }
    return toString().padLeft(2, '0');
  }

  int nonZero() => this == 0 ? 1 : this;

  String properDueDay() {
    final now = AppConstants.currentDate;
    final days = (this - now.day) == 1 || (this - now.day) == -1
        ? AppLocalizations.current.dueDayExtensionsDay
        : AppLocalizations.current.dueDayExtensionsDays;
    if (now.day < this) {
      return '${AppLocalizations.current.dueDayExtensionsDueIn} ${this - now.day} $days';
    } else if (now.day > this) {
      return '${AppLocalizations.current.dueDayExtensionsDelayedSince} ${now.day - this} $days';
    }
    return AppLocalizations.current.dueDayExtensionsDueToday;
  }

  String properOldMonthsDelay(DateTime date) {
    Duration difference = AppConstants.currentDate.difference(date);

    return '${AppLocalizations.current.dueDayExtensionsDelayedSince} ${difference.inDays.abs()} days';
  }
}

extension DoubleExtensions on double {
  String formatCurrency() {
    if (this <= 0) {
      return 'R\$0,00';
    }
    String formattedNumber = '${this / 100}';
    List<String> parts = formattedNumber.split('.');
    RegExp regex = RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))');

    parts[0] =
        parts[0].replaceAllMapped(regex, (Match match) => '${match[1]},');

    if (parts.length > 1) {
      parts[1] = parts[1].padRight(2, '0');
      return 'R\$${parts[0]}.${parts[1]}';
    }
    return 'R\$${parts[0]},00';
  }
}
