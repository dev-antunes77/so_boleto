import 'package:so_boleto/domain/models/bill.dart';
import 'package:so_boleto/domain/models/prompt_bill.dart';

abstract interface class HiveBills {
  Future<List<BillModel>> getBills();
  Future<void> createBill(BillModel bill);
  Future<void> addPrompBills(List<PromptBill> promptBills);
  Future<void> updateBill(BillModel bill);
  Future<void> deleteBill(String id);
}
