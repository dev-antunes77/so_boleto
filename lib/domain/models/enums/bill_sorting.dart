enum BillSorting {
  date('date'),
  name('name'),
  value('value'),
  dueDay('dueDay');

  const BillSorting(this.kind);
  final String kind;

  bool get byName => this == name;
  bool get byValue => this == value;
  bool get byDueDay => this == dueDay;
}
