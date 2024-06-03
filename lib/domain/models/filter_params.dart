import 'package:so_boleto/domain/models/enums/bill_category.dart';

class FilterParams {
  FilterParams({
    List<BillCategory>? categoryList,
    List<int>? priceRange,
    List<int>? dueDayRange,
    List<int>? parcelRange,
  })  : categoryList = categoryList ?? [],
        priceRange = priceRange ?? [],
        dueDayRange = dueDayRange ?? [],
        parcelRange = parcelRange ?? [];

  final List<BillCategory> categoryList;
  final List<int> priceRange;
  final List<int> dueDayRange;
  final List<int> parcelRange;

  FilterParams copyWith({
    List<BillCategory>? categoryList,
    List<int>? priceRange,
    List<int>? dueDayRange,
    List<int>? parcelRange,
  }) {
    return FilterParams(
      categoryList: categoryList ?? this.categoryList,
      priceRange: priceRange ?? this.priceRange,
      dueDayRange: dueDayRange ?? this.dueDayRange,
      parcelRange: parcelRange ?? this.parcelRange,
    );
  }
}
