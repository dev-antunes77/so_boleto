import 'package:intl/intl.dart';

extension DateTimeExtensions on DateTime {
  String dateTimeToString() =>
      '${day.toString().padLeft(2, '0')}/${month.toString().padLeft(2, '0')}';

  String dateTimeToStringData() => DateFormat.yMd().add_jms().format(this);

  String getFormattedCreatedAt() {
    final DateFormat format = DateFormat('dd/MM/yyyy');
    return format.format(this);
  }

  DateTime changeMonth({required bool isAddition}) {
    int year = this.year;
    int month = this.month;
    int day = this.day;

    int newMonth = isAddition ? month + 1 : month - 1;
    int newYear = year;
    if (isAddition) {
      if (newMonth > 12) {
        newMonth = 1;
        newYear += 1;
      } else {
        if (newMonth < 1) {
          newMonth = 12;
          newYear -= 1;
        }
      }
    }
    int daysInNewMonth = DateTime(newYear, newMonth + 1, 0).day;

    if (day > daysInNewMonth) {
      day = daysInNewMonth;
    }
    return DateTime(newYear, newMonth, day);
  }
}
