import 'package:so_boleto/domain/models/enums/bill_category.dart';
import 'package:so_boleto/domain/models/prompt_bill.dart';

abstract final class PromptBillData {
  static final List<PromptBill> promptBills = [
    PromptBill(
      id: '00000000001',
      name: 'Água',
      category: BillCategory.water,
      isSelected: false,
    ),
    PromptBill(
      id: '00000000002',
      name: 'Aluguel',
      category: BillCategory.rent,
      isSelected: false,
    ),
    PromptBill(
      id: '00000000003',
      name: 'Carro',
      category: BillCategory.automobile,
      isSelected: false,
    ),
    PromptBill(
      id: '00000000004',
      name: 'Cartão',
      category: BillCategory.creditCard,
      isSelected: false,
    ),
    PromptBill(
      id: '00000000005',
      name: 'Escola',
      category: BillCategory.education,
      isSelected: false,
    ),
    PromptBill(
      id: '00000000006',
      name: 'Faculdade',
      category: BillCategory.education,
      isSelected: false,
    ),
    PromptBill(
      id: '00000000007',
      name: 'Gás',
      category: BillCategory.gas,
      isSelected: false,
    ),
    PromptBill(
      id: '00000000008',
      name: 'Internet',
      category: BillCategory.internet,
      isSelected: false,
    ),
    PromptBill(
      id: '00000000009',
      name: 'Luz',
      category: BillCategory.electricity,
      isSelected: false,
    ),
    PromptBill(
      id: '00000000010',
      name: 'Mercado',
      category: BillCategory.groceries,
      isSelected: false,
    ),
    PromptBill(
      id: '00000000011',
      name: 'Pet shop',
      category: BillCategory.petShop,
      isSelected: false,
    ),
    PromptBill(
      id: '00000000012',
      name: 'Plano de saúde',
      category: BillCategory.healthCare,
      isSelected: false,
    ),
    PromptBill(
      id: '00000000013',
      name: 'Remédios',
      category: BillCategory.healthCare,
      isSelected: false,
    ),
    PromptBill(
      id: '00000000014',
      name: 'Telefone',
      category: BillCategory.communication,
      isSelected: false,
    ),
    PromptBill(
      id: '00000000015',
      name: 'Transporte',
      category: BillCategory.transportation,
      isSelected: false,
    ),
  ];
}
