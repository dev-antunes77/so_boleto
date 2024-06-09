import 'package:so_boleto/domain/models/enums/bill_category.dart';

final class PromptBill {
  PromptBill({
    required this.id,
    required this.name,
    required this.category,
    required this.isSelected,
    int? value,
    int? dueDay,
  })  : value = value ?? 0,
        dueDay = dueDay ?? 0;

  final String id;
  final String name;
  final BillCategory category;
  int value;
  int dueDay;
  bool isSelected;

  PromptBill copyWith({
    String? id,
    String? name,
    BillCategory? category,
    int? value,
    int? dueDay,
    bool? isSelected,
  }) {
    return PromptBill(
      id: id ?? this.id,
      name: name ?? this.name,
      category: category ?? this.category,
      isSelected: isSelected ?? this.isSelected,
      dueDay: dueDay ?? this.dueDay,
      value: value ?? this.value,
    );
  }
}
