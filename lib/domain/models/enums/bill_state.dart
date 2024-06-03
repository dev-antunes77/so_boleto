enum BillStatus {
  open('Open'),
  payed('Payed'),
  delayed('Delayed');

  const BillStatus(this.value);
  final String value;

  List<String> get billStatusList {
    List<String> list = [];
    for (var element in BillStatus.values) {
      list.add(element.value);
    }
    return list;
  }
}
