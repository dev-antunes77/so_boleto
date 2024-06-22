import 'package:intl/intl.dart';

extension DateTimeExtensions on DateTime {
  String dateTimeToString() =>
      '${day.toString().padLeft(2, '0')}/${month.toString().padLeft(2, '0')}';

  String dateTimeToStringData() => DateFormat.yMd().add_jms().format(this);

  String getFormattedCreatedAt() {
    final DateFormat format = DateFormat('dd/MM/yyyy');
    return format.format(this);
  }
}
