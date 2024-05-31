import 'package:so_boleto/domain/models/enums/bill_category.dart';

class FilterParams {
  FilterParams({
    List<BillCategory>? categoryList,
    int? value,
    bool? dueEveryMonth,
    int? dueDay,
    int? parcelsLeft,
    int? totalParcels,
  })  : categoryList = categoryList ?? [],
        value = value ?? 1,
        dueEveryMonth = dueEveryMonth ?? false,
        dueDay = dueDay ?? DateTime.now().day,
        parcelsLeft = parcelsLeft ?? 0,
        totalParcels = totalParcels ?? 0;

  final List<BillCategory> categoryList;
  final int value;
  final bool dueEveryMonth;
  final int parcelsLeft;
  final int dueDay;
  final int totalParcels;

  FilterParams copyWith({
    List<BillCategory>? categoryList,
    int? value,
    bool? dueEveryMonth,
    int? parcelsLeft,
    int? totalParcels,
  }) {
    return FilterParams(
      categoryList: categoryList ?? this.categoryList,
      value: value ?? this.value,
      dueEveryMonth: dueEveryMonth ?? this.dueEveryMonth,
      parcelsLeft: parcelsLeft ?? this.parcelsLeft,
      totalParcels: totalParcels ?? this.totalParcels,
    );
  }
}
