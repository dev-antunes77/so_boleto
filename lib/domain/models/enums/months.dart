import 'package:so_boleto/core/l10n/generated/l10n.dart';

enum Months {
  january('january', 1),
  february('february', 2),
  march('march', 3),
  april('april', 4),
  may('may', 5),
  june('june', 6),
  july('july', 7),
  august('august', 8),
  september('september', 9),
  october('october', 10),
  november('november', 11),
  december('december', 12);

  const Months(this.name, this.number);

  final String name;
  final int number;

  String get monthName {
    switch (this) {
      case Months.january:
        return AppLocalizations.current.monthJanuary;
      case Months.february:
        return AppLocalizations.current.monthFebruary;
      case Months.march:
        return AppLocalizations.current.monthMarch;
      case Months.april:
        return AppLocalizations.current.monthApril;
      case Months.may:
        return AppLocalizations.current.monthMay;
      case Months.june:
        return AppLocalizations.current.monthJune;
      case Months.july:
        return AppLocalizations.current.monthJuly;
      case Months.august:
        return AppLocalizations.current.monthAugust;
      case Months.september:
        return AppLocalizations.current.monthSeptember;
      case Months.october:
        return AppLocalizations.current.monthOctober;
      case Months.november:
        return AppLocalizations.current.monthNovember;
      case Months.december:
        return AppLocalizations.current.monthDecember;
    }
  }
}
