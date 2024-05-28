extension IntExtensions on int {
  String addLeadingZero() {
    if (this <= -10 && this >= 10) {
      return toString();
    }
    return toString().padLeft(2, '0');
  }

  String properDueDay() {
    final now = DateTime.now();
    final days =
        (this - now.day) == 1 || (this - now.day) == -1 ? 'dia' : 'dias';
    if (now.day < this) {
      return 'Vence em ${this - now.day} $days';
    } else if (now.day > this) {
      return 'Vencida há ${now.day - this} $days';
    }
    return 'Vence hoje';
  }
}

extension DoubleExtensions on double {
  String formatCurrency() {
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
