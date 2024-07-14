import 'package:so_boleto/core/l10n/generated/l10n.dart';
import 'package:so_boleto/domain/models/enums/bill_category.dart';
import 'package:so_boleto/domain/models/prompt_bill.dart';

abstract final class PromptBillData {
  static final List<PromptBill> promptBills = [
    PromptBill(
      id: '00000000001',
      name: AppLocalizations.current.categoryWater,
      category: BillCategory.water,
      isSelected: false,
    ),
    PromptBill(
      id: '00000000002',
      name: AppLocalizations.current.categoryRent,
      category: BillCategory.rent,
      isSelected: false,
    ),
    PromptBill(
      id: '00000000003',
      name: AppLocalizations.current.categoryAutomobile,
      category: BillCategory.automobile,
      isSelected: false,
    ),
    PromptBill(
      id: '00000000004',
      name: AppLocalizations.current.prompBillCourse,
      category: BillCategory.education,
      isSelected: false,
    ),
    PromptBill(
      id: '00000000005',
      name: AppLocalizations.current.prompBillSchool,
      category: BillCategory.education,
      isSelected: false,
    ),
    PromptBill(
      id: '00000000006',
      name: AppLocalizations.current.prompBillCollege,
      category: BillCategory.education,
      isSelected: false,
    ),
    PromptBill(
      id: '00000000007',
      name: AppLocalizations.current.categoryGas,
      category: BillCategory.gas,
      isSelected: false,
    ),
    PromptBill(
      id: '00000000008',
      name: AppLocalizations.current.categoryInternet,
      category: BillCategory.internet,
      isSelected: false,
    ),
    PromptBill(
      id: '00000000009',
      name: AppLocalizations.current.categoryElectricity,
      category: BillCategory.electricity,
      isSelected: false,
    ),
    PromptBill(
      id: '00000000010',
      name: AppLocalizations.current.categoryGroceries,
      category: BillCategory.groceries,
      isSelected: false,
    ),
    PromptBill(
      id: '00000000011',
      name: AppLocalizations.current.categorypetShop,
      category: BillCategory.petShop,
      isSelected: false,
    ),
    PromptBill(
      id: '00000000012',
      name: AppLocalizations.current.prompBillHelthInsurance,
      category: BillCategory.healthCare,
      isSelected: false,
    ),
    PromptBill(
      id: '00000000013',
      name: AppLocalizations.current.prompBillMedicine,
      category: BillCategory.healthCare,
      isSelected: false,
    ),
    PromptBill(
      id: '00000000014',
      name: AppLocalizations.current.categoryTelephone,
      category: BillCategory.telephone,
      isSelected: false,
    ),
    PromptBill(
      id: '00000000015',
      name: AppLocalizations.current.categoryTransportation,
      category: BillCategory.transportation,
      isSelected: false,
    ),
    PromptBill(
      id: '00000000016',
      name: AppLocalizations.current.prompBillMaintenance,
      category: BillCategory.maintenance,
      isSelected: false,
    ),
    PromptBill(
      id: '00000000017',
      name: AppLocalizations.current.prompBillRepairs,
      category: BillCategory.maintenance,
      isSelected: false,
    ),
  ];
}
