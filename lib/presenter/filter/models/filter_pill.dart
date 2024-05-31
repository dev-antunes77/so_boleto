import 'package:so_boleto/domain/models/enums/bill_category.dart';

class FilterPill {
  final BillCategory category;
  bool isSelected;
  FilterPill({
    required this.category,
    required this.isSelected,
  });

  static List<FilterPill> get filterList {
    final List<FilterPill> filters = [];
    for (var categ in categoryMap.entries) {
      final filter = FilterPill(category: categ.key, isSelected: false);
      filters.add(filter);
    }
    return filters;
  }
}
