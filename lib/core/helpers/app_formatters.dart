abstract class AppFormatters {
  static String parcelLabelFormatter(bool dueEveryMonth, int parcels) {
    if (dueEveryMonth) {
      return 'Conta mensal';
    } else if (parcels > 1) {
      return 'Parcelas';
    }
    return 'Conta única';
  }

  static String parcelInfoFormatter(bool dueEveryMonth, int parcels) {
    if (dueEveryMonth) {
      return 'Mensal';
    } else if (parcels > 1) {
      return '$parcels vezes';
    }
    return '1 vez';
  }

  static String parcelRelationFormatter(
      bool dueEveryMonth, int parcels, int payedParcels) {
    if (dueEveryMonth) {
      return 'Mensal';
    } else if (parcels > 1) {
      return '$payedParcels de $parcels';
    }
    return 'Conta única';
  }
}
