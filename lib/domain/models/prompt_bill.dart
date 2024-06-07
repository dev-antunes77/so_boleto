import 'package:so_boleto/domain/models/enums/bill_category.dart';

final class PromptBill {
  PromptBill({
    required this.id,
    required this.name,
    required this.category,
    required this.isSelected,
  });

  final String id;
  final String name;
  final BillCategory category;
  bool isSelected;

  PromptBill copyWith({
    String? id,
    String? name,
    BillCategory? category,
    bool? isSelected,
  }) {
    return PromptBill(
      id: id ?? this.id,
      name: name ?? this.name,
      category: category ?? this.category,
      isSelected: isSelected ?? this.isSelected,
    );
  }
}
