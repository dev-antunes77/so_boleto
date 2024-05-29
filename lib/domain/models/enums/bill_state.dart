enum BillStatus {
  open,
  payed,
  delayed,
}

List<String> get billStatusList {
  List<String> list = [];
  for (var element in billStatusMap.entries) {
    list.add(element.value['string']);
  }
  return list;
}

Map<BillStatus, dynamic> billStatusMap = {
  BillStatus.open: {'string': 'Open'},
  BillStatus.payed: {'string': 'Payed'},
  BillStatus.delayed: {'string': 'Delayed'}
};
