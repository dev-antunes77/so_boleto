enum BillState {
  open,
  payed,
  delayed,
}

List<String> get billStateList {
  List<String> list = [];
  for (var element in billStateMap.entries) {
    list.add(element.value['string']);
  }
  return list;
}

Map<BillState, dynamic> billStateMap = {
  BillState.open: {'string': 'Open'},
  BillState.payed: {'string': 'Payed'},
  BillState.delayed: {'string': 'Delayed'}
};
